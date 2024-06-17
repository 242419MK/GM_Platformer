/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
// W Draw GUI Event
draw_self(); // Rysowanie siebie, jeśli potrzebne

//var time = player_run_time
//draw_text(200, 300, string(time));
draw_set_font(fPixeloid32)


if(room==Menu_Player_Name)
{
	draw_sprite_ext(sLock_Name,0,480,115,3,3,0,c_white,1);
}

if(stop_typing=true)
{
	draw_set_color(c_gray);
}
else 
{
	draw_set_color(c_red);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


if(room==Menu_Player_Name)
{
	draw_text(x,y,player_name);
}