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
		if(instance_exists(oPlayer))
		{
			if(oPlayer.overtime>3600 && !buffed)
			{
				loot_number = loot_number*2;
				buffed = true;
			}
		}
		for(i=0;i<loot_number;i++)
		{
			var value = random(10);

				if(value>=8){
				reward = oGreenHearth;
				}
				else if(value>=4 and value<9)
				{
				reward = oBlueHearth;	
				}
				else {
				reward = oRedHearth;
				}
		var reward_instance = instance_create_layer(x, y-50, "Player", reward);
		}
	}
}



