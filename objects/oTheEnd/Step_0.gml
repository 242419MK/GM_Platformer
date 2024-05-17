/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(ending=false)
{
	x = oCamera.x
	y = oCamera.y-200
}

if(game_over=true)
{
	visible=true;
	if(keyboard_check(ord("G")))
	{
		room_goto(Menu);
		ending = true;
	}
}