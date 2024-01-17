
vsp3 = vsp3 + grv3;

if (place_meeting(x, y + vsp3, oWall))
{
	while(!place_meeting(x, y + sign(vsp3) ,oWall))
	{
		y = y +sign(vsp3);
	}
	vsp3=0;
}
y = y + vsp3;

sprite_index = sGreenHearth;


if(place_meeting(x,y,oPlayer))
{
	oPlayer.green_hearths+=1;
	instance_destroy();
}

death_timer -=1;

if(death_timer == 0 )
{
	instance_destroy();
}

