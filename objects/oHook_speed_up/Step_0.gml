/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(visible)
{
	if (place_meeting(x, y, oCrosshair) && !transactionCompleted && mouse_check_button_pressed(mb_left))
	{
		if(oPlayer.cash >= price)
		{
			oReroll_upg2.bought=true;
			oPlayer.cash -= price;
			oPlayer.hook_speed_bonus += 2;
		
			transactionCompleted = true;
			with(oBought)
			{
				if(place_meeting(x,y, oHook_speed_up))
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
		if(place_meeting(x,y, oHook_speed_up))
			{
				visible=true;
			}
		}
	}
	else 
	{
		
		with(oUnable_to_buy)
		{
		if(place_meeting(x,y, oHook_speed_up))
			{
				visible=false;
			}
		}
	}
	
	if(oPlayer.x> x-64 && oPlayer.x < x+64 )
	{
		oHook_speed_info.visible=true;
	}
	else
	{
		oHook_speed_info.visible=false;
	}
}



