/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(oBOSS.visible == false)
{
	visible=true;
	if(scale==true)
	{
	image_xscale+=1;
	image_yscale+=1;	
	}
	counter++;
}

if(counter>=animation_time){
scale=false;
if(instance_exists(oEnemy))
{
	with(oEnemy)
	{
	instance_destroy()
	oPlayer.progress=0;
	}
}
visible=false;
}


