/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(instance_exists(oPlayer))
{
	x = oPlayer.x;
	y=oPlayer.y+100;
}
if(room==Level1)
{
	start_counting=true;
}

if(start_counting)
{
	player_run_time=player_run_time+1/60;
}

if (count_score==true and final_time_achieved == false)
{
final_time = player_run_time;
final_time_achieved = true;
start_counting=false;
	
if (final_time < 600) {
	time_factor = 0.01 + (2 - 0.01) * (final_time / 600);
} else if (final_time < 1200) {
	time_factor = 2 - (2 - 0.01) * ((final_time - 600) / 600);
} else {
	time_factor = 0.01;
}

player_score = enemies_killed * time_factor
}


if(room!=Menu_Player_Name)
{
	sprite_index = sText_box_2;
}

if(instance_exists(oPlayer))
{
	oPlayer.player_name = player_name;
}


if(stop_typing=false)
{
	if(keyboard_check(vk_anykey) and string_length(player_name) < max_length)
	{
		player_name = player_name + string(keyboard_string);
		keyboard_string="";
	}

	if(keyboard_check(vk_backspace) and !keyboard_check(vk_backspace) and delete_timer=2)
	{
		player_name = string_delete(player_name, string_length(player_name), 1);
		delete_timer=0;
		keyboard_string="";
	}

	if(keyboard_check_pressed(vk_backspace))
	{
		player_name = string_delete(player_name, string_length(player_name),1);
		keyboard_string="";
		delete_timer=-4;
	}

	if(delete_timer !=2)
	{
		delete_timer++;
	}
}


if(instance_exists(oTheEnd))
{
	if(oTheEnd.game_over==true)
{
	visible=false;
}
}

