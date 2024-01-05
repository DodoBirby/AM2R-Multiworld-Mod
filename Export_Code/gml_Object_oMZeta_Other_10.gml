var dmg, flashtime;
dmg = 10
flashtime = 20
if (other.smissile == 1)
{
    dmg = 50
    flashtime = 60
}
myhealth -= dmg
flashing = flashtime
canbehit = 0
hits_taken += 1
if (myhealth <= 0)
{
    state = 100
    statetime = 0
    alarm[10] = 1
    alarm[11] = 160
    with (body_obj)
        instance_destroy()
    with (head_obj)
        instance_destroy()
    with (mask_obj)
        instance_destroy()
    mus_fadeout(musZetaFight)
    oMusicV2.bossbgm = 0
    with (instance_create((oCharacter.x - 8), (oCharacter.y - 8), oMetroidItem))
    {
        multiItem = GetMultiItem((other.myid + 310))
        itemid = -1
        visible = false
        active = 1
        skip = 1
    }
    global.metdead[myid] = 1
    global.monstersleft -= 1
    global.monstersarea -= 1
    check_areaclear()
    global.dmap[mapposx, mapposy] = 11
    with (oControl)
        event_user(2)
}
if (myhealth > 0)
{
    PlaySoundMono(sndMZetaHit)
    roaring = 15
}
