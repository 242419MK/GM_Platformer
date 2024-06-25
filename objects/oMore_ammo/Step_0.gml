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
			oPlayer.maxAmmo += 1;
			oPlayer.ammo = oPlayer.maxAmmo;
			transactionCompleted = true;
			with(oBought)
			{
				if(place_meeting(x,y, oMore_ammo))
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
		if(place_meeting(x,y, oMore_ammo))
			{
				visible=true;
			}
		}
	}
	else 
	{
		
		with(oUnable_to_buy)
		{
		if(place_meeting(x,y, oMore_ammo))
		{
			visible=false;
		}
	}
}
	
	if(oPlayer.x> x-64 && oPlayer.x < x+64 )
	{
		oMoreAmmo_info.visible=true;
	}
	else
	{
		oMoreAmmo_info.visible=false;
	}	
}



