/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if (place_meeting(x, y, oCrosshair) && mouse_check_button_pressed(mb_left)&& bought==false)
	{

	oUpgrade_choose.wybor2++;
	if(oUpgrade_choose.wybor2>3)
	{
		oUpgrade_choose.wybor2=0;
	}
	oPlayer.cash-=5;
	}
	
if(bought==true)
{
	sprite_index = sReroll_end;
}
else sprite_index=sReroll_upg;