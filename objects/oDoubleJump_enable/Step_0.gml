/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(visible)
{
	if (place_meeting(x, y, oCrosshair) && !transactionCompleted && mouse_check_button_pressed(mb_left))
	{
		if(oPlayer.cash >= price)
		{
			oPlayer.cash -= price;
			oPlayer.double_jump_enabled = true;
		
			transactionCompleted = true;
			with(oBought)
			{
				if(place_meeting(x,y, oDoubleJump_enable))
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
		if(place_meeting(x,y, oDoubleJump_enable))
			{
				visible=true;
			}
		}
	}
	
	if(oPlayer.x> x-64 && oPlayer.x < x+64 )
	{
		oDoubleJump_info.visible=true;
	}
	else
	{
		oDoubleJump_info.visible=false;
	}
}



