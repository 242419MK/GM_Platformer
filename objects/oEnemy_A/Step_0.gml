vsp2 = vsp2 + grv2;
if (place_meeting(x, y + vsp2, oWall))
	{
		while(!place_meeting(x, y + sign(vsp2) ,oWall))
		{
			y = y +sign(vsp2);
		}
		vsp2=0;
	}
		
hsp2 = turn * walksp2;
if (place_meeting(x+hsp2, y, oWall))
	{
		while(!place_meeting(x+sign(hsp2), y, oWall))
		{
		    x = x + sign(hsp2);
		}
		hsp2 = 0;
		turn = - turn;
	}
	
jumpcd-=1;
if(jumpcd<=0){
	var rand = random(30);
	var rand2 = random(10);
y = y - (10 + rand2);
jumpcd=10+rand;
}

image_speed=0;
image_index = 0;
image_xscale = turn;
	
	
if(!grabbed)
{
	x = x + hsp2;
	y = y + vsp2;
}

if (place_meeting(x, y, oPlayer)) 
{
	speed=0;
    image_index = 1;
	rage = true;
    oPlayer.hp -= 0.2;
	if(oPlayer.hp<160){
	oPlayer.damaged=true;
	}
		
}
	
if(rage)
{
rage_timer-=1;
	if(rage_timer==0){
	image_index = 0;
	rage_timer=30;
	rage  = false;
	}
}
	
if (!place_meeting(x, y, oPlayer)and grabbed) 
{
    grabbed=false;
}
	
if(dead==true)
{
	var reward = instance_create_layer(x, y-50, "Player", oBronzeCoin);
	instance_destroy();
}

if(timeEnds==true)
{
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	
}