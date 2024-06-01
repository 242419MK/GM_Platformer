/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(ending=false)
{
	x = oCamera.x
	y = oCamera.y-100
}

if(game_over=true)
{
	visible=true;
	if(keyboard_check(ord("G")))
	{ 
		instance_destroy(oPlayer);
		game_end();
		ending = true;
	}
}