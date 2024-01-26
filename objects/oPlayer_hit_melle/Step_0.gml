/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(instance_exists(oPlayer))
{
x = oPlayer.x
y = oPlayer.y	
image_xscale = oPlayer.image_xscale;
	if(show)
	{
		image_speed=0.5;
		visible=true;	
		show_counter--;
		if(show_counter<=0)
			{
				visible=false;
				show=false;
				show_counter = 9;
			}
	}



}





