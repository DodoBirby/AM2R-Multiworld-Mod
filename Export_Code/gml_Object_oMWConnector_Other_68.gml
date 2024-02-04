var type_event, ip, _buffer, receivedString, result, newline, itemMap, itemList, msg, returnMap, command, locationsMap, location, locationset, checkList, i, itemsList, missilecount, supercount, pbcount, etankcount, item, prevtanks, file;
type_event = ds_map_find_value(async_load, "type")
ip = ds_map_find_value(async_load, "ip")
switch type_event
{
    case 1:
        socket = ds_map_find_value(async_load, "socket")
        popup_text("AP Connected")
        break
    case 3:
        newline = "
"
        _buffer = ds_map_find_value(async_load, "buffer")
        receivedString = buffer_read(_buffer, buffer_string)
        itemMap = json_decode(receivedString)
        command = ds_map_find_value(itemMap, "cmd")
        locationset = 0
        if (command == "locations")
        {
            locationset = 1
            locationsMap = ds_map_find_value(itemMap, "items")
            global.dnacount = real(ds_map_find_value(itemMap, "metroids"))
            location = ds_map_find_first(locationsMap)
            while (!is_undefined(location))
            {
                global.multiItem[real(location)] = real(ds_map_find_value(locationsMap, location))
                location = ds_map_find_next(locationsMap, location)
            }
            popup_text("Seed Received")
            global.seedreceived = 1
        }
        else if (command == "items" && instance_exists(oCharacter))
        {
            missilecount = 0
            supercount = 0
            pbcount = 0
            etankcount = 0
            prevtanks = global.dnatanks
            global.dnatanks = 0
            itemsList = ds_map_find_value(itemMap, "items")
            for (i = 0; i < ds_list_size(itemsList); i++)
            {
                item = ds_list_find_value(itemsList, i)
                if (item < 15 && global.inventory[item] == 0)
                {
                    with (instance_create((oCharacter.x - 8), (oCharacter.y - 8), oMetroidItem))
                    {
                        remoteItem = 1
                        multiItem = item
                        itemid = -1
                        visible = false
                        active = 1
                        skip = 1
                    }
                }
                else if (item == 15)
                    missilecount++
                else if (item == 16)
                    supercount++
                else if (item == 17)
                    etankcount++
                else if (item == 18)
                    pbcount++
                else if (item == 19)
                    global.dnatanks++
            }
            if (prevtanks != global.dnatanks)
            {
                check_areaclear()
                sfx_play(sndMessage)
            }
            if (etankcount != global.etanks)
            {
                sfx_play(sndMessage)
                global.etanks = etankcount
                global.maxhealth = (99 + ((global.etanks * 100) * oControl.mod_etankhealthmult))
                global.playerhealth = global.maxhealth
            }
            if (missilecount != global.mtanks)
            {
                sfx_play(sndMessage)
                global.mtanks = missilecount
                global.maxmissiles = (oControl.mod_Mstartingcount + (global.mtanks * 5))
                global.missiles = global.maxmissiles
            }
            if (supercount != global.stanks)
            {
                sfx_play(sndMessage)
                global.stanks = supercount
                global.maxsmissiles = (global.stanks * 2)
                global.smissiles = global.maxsmissiles
            }
            if (pbcount != global.ptanks)
            {
                sfx_play(sndMessage)
                global.ptanks = pbcount
                global.maxpbombs = (global.ptanks * 2)
                global.pbombs = global.maxpbombs
            }
        }
        returnMap = ds_map_create()
        checkList = ds_list_create()
        for (i = 0; i < 350; i++)
        {
            if (global.item[i] == 1)
                ds_list_add(checkList, i)
        }
        for (i = 0; i < 46; i++)
        {
            if (global.metdead[i] == 1)
                ds_list_add(checkList, (i + 310))
        }
        ds_map_add_list(returnMap, "Items", checkList)
        ds_map_add(returnMap, "SlotName", global.slotName)
        ds_map_add(returnMap, "SeedReceived", global.seedreceived)
        ds_map_add(returnMap, "GameCompleted", global.mwcompleted)
        buffer = buffer_create(1024, buffer_grow, 1)
        buffer_seek(buffer, buffer_seek_start, 0)
        buffer_write(buffer, buffer_text, json_encode(returnMap))
        buffer_write(buffer, buffer_text, newline)
        result = network_send_raw(socket, buffer, buffer_tell(buffer))
        buffer_delete(buffer)
        ds_map_destroy(itemMap)
        ds_map_destroy(returnMap)
        break
}

