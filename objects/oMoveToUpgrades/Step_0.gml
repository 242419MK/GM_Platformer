/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(instance_exists(oPlayer))
{
	if (place_meeting(x, y, oPlayer))
	{
	    room_goto(Upgrades); // Replace with the name of the room you want to switch to
		oPlayer.x = 870;
		oPlayer.y = 920;
		oPlayer.hp = oPlayer.maxhp;
	}

	if(oPlayer.progress>=oPlayer.progressMax)
	{
		if(oPlayer.overtime>0)
		{
			visible = true;
		}
	}
}



