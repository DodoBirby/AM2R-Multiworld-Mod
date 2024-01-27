if active
{
    if (oControl.kDown > 0 && (oControl.kDownPushedSteps == 0 || (oControl.kDownPushedSteps > 30 && timer == 0)) && (!editing))
    {
        global.curropt += 1
        if (global.curropt > lastitem)
            global.curropt = 0
        sfx_play(sndMenuMove)
        global.tiptext = tip[global.curropt]
    }
    if (oControl.kUp > 0 && (oControl.kUpPushedSteps == 0 || (oControl.kUpPushedSteps > 30 && timer == 0)) && (!editing))
    {
        global.curropt -= 1
        if (global.curropt < 0)
            global.curropt = lastitem
        sfx_play(sndMenuMove)
        global.tiptext = tip[global.curropt]
    }
    if (oControl.kMenu1 && oControl.kMenu1PushedSteps == 0 && (!editing))
    {
        if (global.curropt == 0)
        {
            sfx_play(sndMenuSel)
            keyboard_string = global.slotName
            editing = 1
            editingoption = 0
        }
        if (global.curropt == 2)
        {
            sfx_play(sndMenuSel)
            if (!instance_exists(oMWConnector))
                instance_create(0, 0, oMWConnector)
        }
        if (global.curropt == 3)
        {
            instance_create(50, 92, oOptionsMain)
            instance_destroy()
            sfx_play(sndMenuSel)
        }
    }
    if editing
    {
        if (global.curropt == 0)
        {
            global.slotName = keyboard_string
            op[(editingoption + 1)].optext = global.slotName
        }
        if keyboard_check_pressed(vk_return)
            editing = 0
    }
}
timer -= 1
if (timer < 0)
    timer = 8
