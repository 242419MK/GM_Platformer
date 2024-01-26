/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if (place_meeting(x, y, oPlayer))
{
    room_goto(Level1); // Replace with the name of the room you want to switch to
	oPlayer.x = 3584;
	oPlayer.y = 1620;
	
	oPlayer.round_time=18000 + oPlayer.round_time_bonus;
	oPlayer.overtime=0;
}



