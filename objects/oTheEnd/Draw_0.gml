/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_self()

draw_set_font(fPixeloid18)
draw_set_color(c_red);
draw_text(x,y+30,oPlayer_info.player_name)
draw_set_color(c_black)
var minutes = oPlayer_info.final_time div 60;
var seconds = oPlayer_info.final_time mod 60;
var time_string = string_format(minutes, 2, 0) + ":" + string_format(seconds, 2, 0);


draw_text(x,y+60,"Game time: "+time_string)
draw_text(x,y+90,"Points factor:(X"+string(oPlayer_info.time_factor)+")")
draw_text(x,y+120,"Slayed enemies: "+string(oPlayer_info.enemies_killed))
if(boss_defeated==true)
{
	draw_text(x,y+150,"Boss defeated: "+string(1000))
}
else if(boss_defeated==false)
{
	draw_text(x,y+150,"Boss undefeated  :-(  ")
}
draw_text(x,y+180,"Final Score: "+string(oPlayer_info.player_score))

