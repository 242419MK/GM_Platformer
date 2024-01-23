/// @description Update Camera

//Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
}

//Update object position
x += (xTo - x) / 10;
y += (yTo - y) / 10;

x = clamp(x, view_w_half+buff, room_width-view_w_half-buff);
y = clamp(y, view_h_half+buff, room_height-view_h_half-buff);

//screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

//for testing purposes only!

if (keyboard_check_pressed(vk_escape)) {
    game_end(); // This function will end the game
}

if(layer_exists("Mecha_columns"))
{
	layer_x("Mecha_columns",x/2);
}


if(layer_exists("Black_columns"))
{
	layer_x("Black_columns",x/3);
}


if(layer_exists("Backgrounds_1"))
{
	layer_x("Backgrounds_1",x/4);
}
