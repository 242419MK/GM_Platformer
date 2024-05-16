/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if (place_meeting(x, y, oPlayer))
{
    room_goto(LevelBoss); // Replace with the name of the room you want to switch to
	oPlayer.x = 1500;
	oPlayer.y = 600;
	oPlayer.hp = oPlayer.maxhp;
	oPlayer.overtime=0;
	oPlayer.progress=0;
	oPlayer.red_hearths=0;
	oPlayer.blue_hearths=0;
	oPlayer.green_hearths=0;
	oPlayer.purple_hearths=0;
	oPlayer.maxAmmo=4;
	oPlayer.ammo=4;
	oPlayer.lvl=4;
}


