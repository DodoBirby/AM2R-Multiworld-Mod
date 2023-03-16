myhealth -= dmg
flashing = flashtime
canbehit = 0
if (myhealth <= 0)
{
    state = 100
    statetime = 0
    alarm[10] = 1
    alarm[11] = 160
    event_user(2)
    mus_fadeout(musOmegaFight)
    oMusicV2.bossbgm = 0
    with (instance_create((oCharacter.x - 8), (oCharacter.y - 8), scr_itemsopen(scr_metchange(myid))))
    {
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
    if (dmg < 100)
    {
        PlaySoundMono(sndMOmegaHit)
        roaring = 30
    }
    else
    {
        PlaySoundMono(sndMOmegaHit2)
        roaring = 160
    }
}
