/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(visible)
{
	if (place_meeting(x, y, oCrosshair) && !transactionCompleted && mouse_check_button_pressed(mb_left))
	{
		if(oPlayer.cash >= price)
		{
			oReroll_upg1.bought=true;
			oPlayer.cash -= price;
			oPlayer.shield_timer -= 30;
			if(oPlayer.shield_timer<=240)
			{
			oPlayer.shield_timer=240;
			}
			transactionCompleted = true;
			with(oBought)
			{
				if(place_meeting(x,y, oShield_cd))
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
		if(place_meeting(x,y, oShield_cd))
			{
				visible=true;
			}
		}
	}
	else 
	{
		
		with(oUnable_to_buy)
		{
		if(place_meeting(x,y, oShield_cd))
			{
				visible=false;
			}
		}
	}
	
	
	if(oPlayer.x> x-64 && oPlayer.x < x+64 )
	{
		oDMG_info.visible=true;
	}
	else
	{
		oDMG_info.visible=false;
	}
}



