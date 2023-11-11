var type_event, ip, _buffer, receivedString, result, newline, itemMap, itemList, msg, returnMap;
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
        itemList = ds_map_find_value(itemMap, "items")
        returnMap = ds_map_create()
        ds_map_add(returnMap, "Name", "Hello")
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

