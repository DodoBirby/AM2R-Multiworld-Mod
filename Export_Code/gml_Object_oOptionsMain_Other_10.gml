y -= 8
op1 = instance_create(x, y, oPauseOption)
op1.optionid = 0
op1.label = get_text("OptionsMain", "Display")
op2 = instance_create(x, (y + 16), oPauseOption)
op2.optionid = 1
op2.label = get_text("OptionsMain", "Sound")
op3 = instance_create(x, (y + 32), oPauseOption)
op3.optionid = 2
op3.label = get_text("OptionsMain", "Control")
op4 = instance_create(x, (y + 48), oPauseOption)
op4.optionid = 3
op4.label = get_text("ExtrasMenu", "Extras")
op5 = instance_create(x, (y + 64), oPauseOption)
op5.optionid = 4
op5.label = "Multiworld Settings"
op6 = instance_create(x, (y + 80), oPauseOption)
op6.optionid = 5
op6.label = get_text("GlobalOptions", "Exit")
