/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój 

image_speed=1;
// movement logic, move around spawn point and follow enemy if close enough
if (instance_exists(oPlayer) && !grabbed) 
{
	speed=2;
	sprite_index = sEnemy_L;
	if(!timeEnds)
	{
		var distance_to_spawn = point_distance(x, y, spawnpoint_x, spawnpoint_y);
		var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
		// Check if the player is within the enemy's range
		if (distance_to_player < player_range) {
		    // Move smoothly towards the player
		    direction = point_direction(x, y, oPlayer.x, oPlayer.y);
		    if (!place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), oWall)) {
		        x += lengthdir_x(speed, direction);
		        y += lengthdir_y(speed, direction);
		    }
		} else {
		    // Move smoothly within the max range
		    if (distance_to_spawn > max_range) {
		        // Move smoothly towards the spawn point
		        direction = point_direction(x, y, spawnpoint_x, spawnpoint_y);
		        if (!place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), oWall)) {
		            x = lerp(x, x + lengthdir_x(speed, direction), follow_speed);
		            y = lerp(y, y + lengthdir_y(speed, direction), follow_speed);
		        }
		    } else {
		        // Move smoothly in a random direction
		        var random_direction = random(360);
		        if (!place_meeting(x + lengthdir_x(speed, random_direction), y + lengthdir_y(speed, random_direction), oWall)) {
		            x = lerp(x, x + lengthdir_x(speed, random_direction), follow_speed);
		            y = lerp(y, y + lengthdir_y(speed, random_direction), follow_speed);
		        }
		    }
		}
	}
	
if(timeEnds==true)
	{
		if(!hp_buff)
		{
			fullHp=400;
			hp=fullHp;
			hp_buff=true;	
		}
		direction = point_direction(x, y, oPlayer.x, oPlayer.y);
		speed = rage_speed;
	}
}


if(prevx<x)
{
	attack_adjust=32;
}
if(prevx>x)
{
	attack_adjust=-32;
}
prevx = x;

//atak melle
if (place_meeting(x-attack_adjust, y, oPlayer) && instance_exists(oPlayer) && !grabbed && !hitted) 
{
    speed = 0;
    sprite_index = sEnemy_L_Attack;

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
if (!place_meeting(x, y, oPlayer)) 
{
    rage_timer = 0;
	rage=false;
}

//grab logic, freeze enemy for 3s and set its speed to 0
if(grabbed)
{
	if(place_meeting(x,y,oPlayer))
	{
	speed = 0;
	}
	sprite_index = sEnemy_L_hooked;
	grab_free_time--;
	if(grab_free_time<=0)
	{
		grabbed=false;
		grab_free_time=120;
	}
}

//if hitted by player change sprite and make enemy unable to attack and move for 30frames
if(hitted)
{
	sprite_index = sEnemy_L_hit;
	hit_counter--;
	if(hit_counter<=0)
	{
		hit_counter=30;
		hitted=false;
	}
}


//death logic, drop a green hearths, and 2 more if overtime > 1min
if(dead==true)
{
	var reward = instance_create_layer(x, y-30, "Player", oGreenHearth);
	if(grabbed)
	{
		var reward2 = instance_create_layer(x+10, y-20, "Player", oGreenHearth);
	}
	if(better_reward)
	{
		var reward3 = instance_create_layer(x-20, y-20, "Player", oGreenHearth);
		var reward4 = instance_create_layer(x+20, y-20, "Player", oGreenHearth);
	}
	instance_destroy();
}

