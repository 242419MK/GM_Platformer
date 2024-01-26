/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if (place_meeting(x, y, oPlayer))
{
    room_goto(Upgrades); // Replace with the name of the room you want to switch to
	oPlayer.x = 870;
	oPlayer.y = 870;
	oPlayer.hp = oPlayer.maxhp;
}

if(instance_exists(oPlayer))
{
	if(oPlayer.overtime>0)
	{
		visible = true;
	}
}


