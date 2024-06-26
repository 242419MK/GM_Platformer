/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(end_now==true)
{
	end_counter++;
}
if(end_counter>=end_time)
{
	oTheEnd.boss_defeated=true;
	oTheEnd.game_over=true;
	oPlayer_info.count_score = true;
}
