multiItem = GetMultiItem(itemid)
switch multiItem
{
    case 0:
        sprite_index = sItemBomb
        text1 = "Bombs"
        text1 = get_text("Items", "Bombs")
        text2 = "Press | in Morph Ball mode to deploy"
        text2 = get_text("Items", "Bombs_Text")
        btn1_name = "Fire"
        break
    case 2:
        sprite_index = sItemSpiderBall
        text1 = get_text("Items", "SpiderBall")
        if (global.opspdstyle == 0)
        {
            if (global.opaimstyle == 0)
            {
                text2 = get_text("Items", "SpiderBallPress_Text1")
                btn1_name = "Aim"
            }
            else
            {
                text2 = get_text("Items", "SpiderBallPress_Text2")
                btn1_name = "Aim"
                btn2_name = "Aim2"
            }
        }
        if (global.opspdstyle == 1)
        {
            text2 = get_text("Items", "SpiderBallPress_Text1")
            btn1_name = "Down"
        }
        if (global.opspdstyle == 2)
        {
            if (global.opaimstyle == 0)
            {
                text2 = get_text("Items", "SpiderBallHold_Text1")
                btn1_name = "Aim"
            }
            else
            {
                text2 = get_text("Items", "SpiderBallHold_Text2")
                btn1_name = "Aim"
                btn2_name = "Aim2"
            }
        }
        break
}

