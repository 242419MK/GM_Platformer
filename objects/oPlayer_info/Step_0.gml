/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room==Level1)
{
	start_counting=true;
}
if(start_counting)
{
	player_run_time=player_run_time+1/60;
}
if (!instance_exists(oPlayer) and final_time_achieved == false and (room != Menu and room != Menu_Player_Name and room != Tutorial_Room))
{
    final_time = player_run_time;
    final_time_achieved = true;
}


if(room!=Menu_Player_Name)
{
	visible=false;
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
