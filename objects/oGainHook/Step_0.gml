/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(place_meeting(x,y,oPlayer))
{
	start=true;
}

if(start)
{
	image_xscale-=0.1;
	image_yscale-=0.1;
}


if(image_xscale <=0.1 && image_yscale <= 0.1)
{
	instance_destroy();
	start=false;
	oPlayer.ammo=1;
	oCrosshair.x=x;
	oCrosshair.y=y;
	oCrosshair.visible=true;
}




