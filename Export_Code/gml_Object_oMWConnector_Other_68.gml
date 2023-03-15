var type_event, ip, _buffer, receivedString, result, newline;
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
        popup_text(receivedString)
        buffer = buffer_create(1024, buffer_grow, 1)
        buffer_seek(buffer, buffer_seek_start, 0)
        buffer_write(buffer, buffer_text, "JelloWorld")
        buffer_write(buffer, buffer_text, newline)
        result = network_send_raw(socket, buffer, buffer_tell(buffer))
        popup_text(string(result))
        buffer_delete(buffer)
        break
}

