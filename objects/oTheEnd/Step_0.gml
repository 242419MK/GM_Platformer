/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(ending=false)
{
	x = oCamera.x;
	y = oCamera.y-65;
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
	
	if(boss_defeated==true)
	{
		boss_bonus=1000;
		sprite_index = sEnd_wait_win;
		if(points_added==false)
		{
				oPlayer_info.player_score+=boss_bonus;
				points_added=true;
		}
	}
	else 
	{
		sprite_index = sEnd_wait;
	}
	
}
