if (multiItem < 15)
    global.inventory[multiItem] = 1
switch multiItem
{
    case 0:
        global.bomb = 1
        global.event[50] = 1
        break
    case 2:
        global.spiderball = 1
        break
}

