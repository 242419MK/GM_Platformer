// Coin Step Event
vsp3 = vsp3 + grv3;

if (place_meeting(x, y + vsp3, oWall))
{
    while(!place_meeting(x, y + sign(vsp3), oWall))
    {
        y = y + sign(vsp3);
    }
    vsp3 = 0;
}

if(place_meeting(x,y,oWall))
{
	while(place_meeting(x,y,oWall))
	{
	x=x-1;
	}
}

y = y + vsp3;

sprite_index = sRedHearth;

if(place_meeting(x, y, oPlayer))
{
    oPlayer.red_hearths += 1;
    instance_destroy();
}

death_timer -= 1;

if(death_timer == 0)
{
    instance_destroy();
}