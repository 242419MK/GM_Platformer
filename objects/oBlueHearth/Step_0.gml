/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
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

sprite_index = sBlueHearth;

if(place_meeting(x,y,oWall))
{
	while(place_meeting(x,y,oWall))
	{
	x=x-1;
	}
}

if(place_meeting(x,y,oPlayer))
{
	oPlayer.blue_hearths+=1;
	instance_destroy();
}


death_timer -=1;

if(death_timer == 0 )
{
	instance_destroy();
}


