var type, i;
type = 0
server = network_create_server_raw(type, 64197, 1)
i = 400
repeat (400)
{
    i -= 1
    global.multiItem[i] = 19
}
global.multiItem[0] = 0
