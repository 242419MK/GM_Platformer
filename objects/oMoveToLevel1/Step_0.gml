/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if (place_meeting(x, y, oPlayer))
{
    room_goto(Level1); // Replace with the name of the room you want to switch to
	oPlayer.x = 3584;
	oPlayer.y = 1570;
	oPlayer.hp = oPlayer.maxhp;
	oPlayer.overtime=0;
	oPlayer.progress=0;
	oPlayer.red_hearths=0;
	oPlayer.maxAmmo=1;
	oPlayer.ammo=1;
}



