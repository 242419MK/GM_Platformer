/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(visible)
{
	if (place_meeting(x, y, oCrosshair) && !transactionCompleted && mouse_check_button_pressed(mb_left))
	{
		if(oPlayer.cash >= price)
		{
			oReroll_upg3.bought=true;
			oPlayer.cash -= price;
			oPlayer.max_jump_height += 2;
			oPlayer.jump_height_increment += 0.5;
			
			transactionCompleted = true;
			with(oBought)
			{
				if(place_meeting(x,y, oJump_height_up))
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
		if(place_meeting(x,y, oJump_height_up))
			{
				visible=true;
			}
		}
	}
	else 
	{
		
		with(oUnable_to_buy)
		{
		if(place_meeting(x,y, oJump_height_up))
		{
			visible=false;
		}
	}
}
	
	if(oPlayer.x> x-64 && oPlayer.x < x+64 )
	{
		oJump_height_info.visible=true;
	}
	else
	{
		oJump_height_info.visible=false;
	}	
}



