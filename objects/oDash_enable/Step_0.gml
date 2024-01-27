/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(visible)
{
	if (place_meeting(x, y, oCrosshair) && !transactionCompleted && mouse_check_button_pressed(mb_left))
	{
		if(oPlayer.cash >= price)
		{
			oPlayer.cash -= price;
			oPlayer.dash_enabled = true;
		
			transactionCompleted = true;
			with(oBought)
			{
				if(place_meeting(x,y, oDash_enable))
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
		if(place_meeting(x,y, oDash_enable))
			{
				visible=true;
			}
		}
	}
	else 
	{
		with(oUnable_to_buy)
		{
		if(place_meeting(x,y, oDash_enable))
			{
				visible=false;
			}
		}
	}

	if(oPlayer.x> x-64 && oPlayer.x < x+64 )
	{
		oDash_info.visible=true;
	}
	else
	{
		oDash_info.visible=false;
	}
}



