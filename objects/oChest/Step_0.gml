image_speed = 0;


if (state < 1) 
{
    state = 1;
}
	
if (state == 3)
{
    image_index = 0;
} 

else if (state == 2)
{
    image_index = 1;
} 

else if (state == 1)
{
    image_index = 2;
	deathcd-=1;
	
	if(deathcd<=0)
	{
	instance_destroy();
    var reward_instance = instance_create_layer(x, y-50, "Player", reward);
	}
}



