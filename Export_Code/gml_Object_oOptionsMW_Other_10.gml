y -= 8
op[0] = instance_create(x, y, oMenuLabel)
op[0].text = "Multiworld Settings"
op[1] = instance_create(x, (y + 16), oOptionLR)
op[1].label = "Slot Name"
op[1].optionid = 0
op[2] = instance_create(x, (y + 32), oOptionLR)
op[2].label = "Password"
op[2].optionid = 1
op[3] = instance_create(x, (y + 48), oPauseOption)
op[3].label = "Connect to Python Client"
op[3].optionid = 2
op[4] = instance_create(x, (y + 64), oPauseOption)
op[4].optionid = 3
op[4].label = get_text("GlobalOptions", "Exit")