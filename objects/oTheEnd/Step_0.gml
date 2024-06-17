/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(ending=false)
{
	x = oCamera.x
	y = oCamera.y-20
}

if(game_over=true)
{
	oPlayer_info.count_score=true;
	visible=true;
	if(keyboard_check(ord("G")))
	{ 
		//save_game_data(oPlayer_info.player_name,oPlayer_info.player_score);
		instance_destroy(oPlayer);
		game_end();
		ending = true;
	}
}
