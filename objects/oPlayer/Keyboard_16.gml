/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(dash_enabled)
{
	if (keyboard_check_pressed(vk_shift)) 
		{
		if(dash_cd<=0)
			{
			if(key_left)
				{
					x=x-dash_length;
					dash_cd=dash_max_cd;
					
					if(place_meeting(x,y,oWall))
					{
						while(place_meeting(x,y,oWall))
						{
						x=x-1;
						}
					}
				}
			
			else if(key_right)
				{
					x=x+dash_length;
					dash_cd=dash_max_cd;
					if(place_meeting(x,y,oWall))
					{
						while(place_meeting(x,y,oWall))
						{
						x=x+1;
						}
					}
				}
			
			}	
		}
}





