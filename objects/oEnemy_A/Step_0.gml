vsp2 = vsp2 + grv2;
if (place_meeting(x, y + vsp2, oWall))
	{
		while(!place_meeting(x, y + sign(vsp2) ,oWall))
		{
			y = y +sign(vsp2);
		}
		vsp2=0;
	}
	
if (!place_meeting(x+turn*32, y + 1, oWall))
    {

        turn = -turn;
		
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
	

image_xscale = turn;
	
if(!grabbed)
{
	x = x + hsp2;
	y = y + vsp2;
}

if (place_meeting(x, y, oPlayer)) 
{
	speed=0;
	rage = true;
    oPlayer.hp -= 0.4;
	if(oPlayer.hp<160){
	oPlayer.damaged=true;
	}
		
}
if(!rage){
sprite_index = sEnemy_A_Attack;
}
	
if(rage)
{
rage_timer-=1;
	if(rage_timer==0){
	sprite_index = sEnemy_A;
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
	var reward = instance_create_layer(x, y-50, "Player", oRedHearth);
	instance_destroy();
}

if(timeEnds==true)
{
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	
}