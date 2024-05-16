/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(oPlayer.lvl>=2)
{
instance_destroy();	
}

if (place_meeting(x, y, oPlayer))
{
    room_goto(Level2); // Replace with the name of the room you want to switch to
	oPlayer.x = 3584;
	oPlayer.y = 1570;
	oPlayer.hp = oPlayer.maxhp;
	oPlayer.overtime=0;
	oPlayer.progress=0;
	oPlayer.red_hearths=0;
	oPlayer.blue_hearths=0;
	oPlayer.green_hearths=0;
	oPlayer.purple_hearths=0;
	oPlayer.maxAmmo=2;
	oPlayer.ammo=2;
	oPlayer.lvl=2;
}



