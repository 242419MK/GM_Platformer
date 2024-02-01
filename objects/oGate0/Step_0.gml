/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



if(oPlayer.x> 1720-32 && oPlayer.x < 1720+32 )
{
	open = true;
}

if(open && !close & !instance_exists(oGainHook))
{
	y = y-1;
}

if(y<starty-150)
{
	open=false;
}

if(oPlayer.x>2150 && y<=starty+10)
{
	close=true;
}else close = false;

if(close)
{
	y = y+0.8;
}

