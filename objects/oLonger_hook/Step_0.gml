/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(visible)
{
	if (place_meeting(x, y, oCrosshair) && !transactionCompleted && mouse_check_button_pressed(mb_left))
	{
		if(oPlayer.cash >= price)
		{
			oPlayer.cash -= price;
			oPlayer.hook_long_bonus += 10;
		
			transactionCompleted = true;
			with(oBought)
			{
				if(place_meeting(x,y, oLonger_hook))
				{
					visible=true;
				}
			}
		}
	}
	
	if(oPlayer.cash < price && !transactionCompleted)
	{
		with(oUnable_to_buy)
		{
		if(place_meeting(x,y, oLonger_hook))
			{
				visible=true;
			}
		}
	}
	else 
	{
		with(oUnable_to_buy)
		{
		if(place_meeting(x,y, oLonger_hook))
		{
			visible=false;
		}
	}
}
	
	if(oPlayer.x> x-64 && oPlayer.x < x+64 )
	{
		oLonger_hook_info.visible=true;
	}
	else
	{
		oLonger_hook_info.visible=false;
	}	
}



