// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
///@desc ScreenShake(magnitude,frames)
///@arg Magnitude sets strength of shake 
///@arg Frames sets length of shake (60=1s)

with (oCamera)
{
	if(argument0 > shake_remain)
	{
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
		
	}
}