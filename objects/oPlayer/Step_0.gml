//Movement and wall collisions
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;
hsp = move * walksp;
dash_cd--;
gui_couinter++;

if(gui_couinter%3==0){
gui_hp_counter++;
}

if(gui_hp_counter>7){gui_hp_counter=0;}
vsp += grv;
hood_cd--;

if(hood_cd<=0)
{
	hood_cd=0;
}

if(oPlayer.x>room_width)
{
	oPlayer.x=room_width-200;
}

if(oPlayer.x<0)
{
	oPlayer.x=200;
}
		
if (progress > progressMax) 
{
    progress = progressMax;
}

if(progress >= progressMax)
{
	overtime++;
}

if(instance_exists(oEnemy))
{
	if(progress == progressMax)
	{
		oPlatformUpMax.speed_value = 3;
		oEnemy_S.timeEnds = true;
		oEnemy_S_2.timeEnds = true;
	}

	if(overtime>=1200)
	{
		oEnemy_A.timeEnds = true;
	}

	if(overtime>=3600)
	{
		oEnemy_L.timeEnds = true;
		oEnemy_A.better_reward=true;
		oEnemy_S.better_reward=true;
		oEnemy_S_2.better_reward=true;
		oEnemy_L.better_reward=true;
	}
}

//jumps
if(double_jump_enabled)
	{
	if(keyboard_check_pressed(vk_space) && jump_current > 0)
		{
			vsp = jump_height;
			jump_current--;
		}
	if(place_meeting(x, y + vsp, oWall))
		{
			while(!place_meeting(x, y + sign(vsp), oWall))
			{
				y += sign(vsp);
			}
				if(vsp > 0)
				{
					jump_current = jump_number;
				}
			vsp = 0;
		}
		y = y + vsp;
		}
else {
	if (place_meeting(x, y + 1 , oWall)) && (key_jump)
		{
			vsp = jump_height;
		}
	if (place_meeting(x, y + vsp, oWall))
	{
		while(!place_meeting(x, y+sign(vsp), oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}




//horizontal movement and collisions
if (place_meeting(x+hsp, y, oWall))
{
	while(!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;




//Animation

if(!place_meeting(x,y+1,oWall))
{		
		if (play)
		{
			image_speed = 1.4;
		    sprite_index = sPlayer_attack;
		    if (image_index >= image_number - 1) 
			{
		        play = false; // Set play to false when animation ends
			}
		}
		else 
		{
			if(ammo<maxAmmo)
			{
				sprite_index=sPlayer_jump_shooting_hook;
			}
			else 
			{
				sprite_index = sPlayer_jump;
			}
			
			if(!place_meeting(x,y+1,oPlatformUpMax))
			{
				image_speed = 0;
				if (sign(vsp) > 0 )
				{
					image_index = 0; 
				}
				else
				{
					image_index = 0;
				} 
			}
		}
}

if(place_meeting(x,y+1,oWall))
{
	image_speed = 0.3;
	if (hsp == 0)
	{
		if (play)
		{
			image_speed = 1.4;
		    sprite_index = sPlayer_attack;
		    if (image_index >= image_number - 1) {
		        play = false; // Set play to false when animation ends
		    }
		}
		else 
		{	
			if(ammo<maxAmmo)
			{
				sprite_index=sPlayer_shooting_hook;
			}
			else 
			{
				sprite_index = sPlayer;
			}
		}
	}
	else
	{
		if (play)
		{		
			if(ammo<maxAmmo)
			{
				sprite_index=sPlayer_attack_shooting_hook;
			}
			else 
			{
				sprite_index = sPlayer_attack;
			}
			image_speed = 1.4;
		    if (image_index >= image_number - 1) {
		        play = false; // Set play to false when animation ends
		    }
		}
		else 
		{
			if(ammo<maxAmmo)
			{
				sprite_index=sPlayer_run_shooting_hook;
			}
			else 
			{
				sprite_index = sPlayer_run;
			}
		}
	}
}

if(distance_to_object(oEnemy_Bullet)<5 || distance_to_object(oEnemy_Bullet_Big)<5)
{
	start_hit_animation = true;
}

if(start_hit_animation && hit_counter>0)
{
	sprite_index = sPlayer_hit;
	hit_counter--;
}

if(hit_counter<=0)
{
	start_hit_animation = false;
	hit_counter = 10;
}



if(hsp !=0) image_xscale = sign(hsp);



//hook
if (mouse_check_button_pressed(mb_right) && hood_cd<=0) {
	if(ammo > 0){
		sprite_index = sPlayer_shooting_hook;
	    // Stworzenie kuli na pozycji gracza
	    var bullet = instance_create_layer(x, y, "Player", oBullet);
		bullet.hook_speed = oPlayer.hook_speed_bonus;
		bullet.destroy_timer += oPlayer.hook_long_bonus;
	    var start_x = x;
	    var start_y = y;
	    var dir = point_direction(start_x, start_y, oCrosshair.x, oCrosshair.y);
	    bullet.direction = dir;
	    bullet.speed = 15;
	    bullet.x = start_x + lengthdir_x(30, dir); // 30 to odległość od gracza, możesz dostosować
	    bullet.y = start_y + lengthdir_y(30, dir); // 30 to odległość od gracza, możesz dostosować

	    ammo -= 1; // opóźnienie w klatkach
	}
}


attack_cd -= 1;

// Attack
if (mouse_check_button_pressed(mb_left) && attack_cd <= 0) {
    play = true; // Attack animation

    // Iterate through all instances of oEnemy
    with (oEnemy) {
        // Check if the enemy is within the player's attack range
        if (point_distance(x, y, oPlayer.x, oPlayer.y) < oPlayer.attack_range) {
            // Apply the attack logic to each enemy
			hitted = true;
            hp -= oPlayer.attack_damage;
            if (hp < 0) {
				oPlayer.progress+=value;
                dead = true;
                Shake(14, 10);
            }
			else Shake(5, 10);
        }
    }

    // Iterate through all instances of oChest
    with (oChest) {
        // Check if the chest is within the player's attack range
        if (point_distance(x, y, oPlayer.x, oPlayer.y) < oPlayer.attack_range) {
            // Apply the attack logic to each chest
            state -= 1;
        }
    }

    attack_cd = attack_cd_max;
}


if(hp<0){
walksp=0;
hp_regen=0;

sprite_index = sPlayer_dead;
image_speed=0;
image_index=deadcounter;
deadcounter+=0.25;

if (deadcounter >= 20) 
	{
		instance_destroy(oPlayer);
		room_goto(Menu)
	}

}

if(hp<maxhp)hp = hp + hp_regen;

