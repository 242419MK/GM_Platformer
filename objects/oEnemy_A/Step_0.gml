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
	
image_speed = 1;

//atak melle
if (place_meeting(x, y, oPlayer) && instance_exists(oPlayer) && !grabbed && !hitted) 
{
    speed = 0;
    sprite_index = sEnemy_A_Attack;

    if (rage_timer == 0) // Sprawdź, czy timer osiągnął dokładnie 12
    {
        oPlayer.hp -= damage / oPlayer.armor;
		oPlayer_hit_melle.show = true;
		hit_player=true;
		rage_timer=60;
    }
	
	if(hit_player)
	{
		oPlayer.sprite_index = sPlayer_hit;
		
		if(rage_timer==15){hit_player=false;}
	}

    rage_timer--; 
} 


else if (!grabbed)
{
    sprite_index = sEnemy_A;
    x = x + hsp2;
    y = y + vsp2;
}

if (!place_meeting(x, y, oPlayer)) 
{
    rage_timer = 0;
	rage=false;
}


if(grabbed)
{
	sprite_index = sEnemy_A_hooked;
	grab_free_time--;
	if(grab_free_time<=0)
	{
		grabbed=false;
		grab_free_time=180;
	}
}

if(grabbed && place_meeting(x,y,oPlayer))
{
	speed = 0;
}
	
if(dead==true)
{
	var reward = instance_create_layer(x, y-30, "Player", oRedHearth);
	if(better_reward)
	{
		var reward2 = instance_create_layer(x-20, y-20, "Player", oRedHearth);
	}
	instance_destroy();
}

if(hitted)
{
	sprite_index = sEnemy_A_hit;
	hit_counter--;
	if(hit_counter<=0)
	{
		hit_counter=30;
		hitted=false;
	}
}


if(instance_exists(oPlayer))
{
if(timeEnds)
	{
		damage=7;
		speed = 3;
		direction = point_direction(x,y, oPlayer.x, oPlayer.y)
		jump = true;
	}
}

if(jump)
{
	jump_timer--;
	if(jump_timer<=0)
	{
		jump_height = random_range(30, 60);
		y -= jump_height
		jump_timer = random_range(90, 180);
	}
}