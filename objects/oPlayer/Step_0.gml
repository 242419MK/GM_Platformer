//Movement and wall collisions
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;
hsp = move * walksp;
dash_cd--;
gui_couinter++;



if (hp <= maxhp && hp > 0.875 * maxhp) { hp_icon = 1; } 
else if (hp <= 0.875 * maxhp && hp > 0.75 * maxhp) { hp_icon = 2; } 
else if (hp <= 0.75 * maxhp && hp > 0.625 * maxhp) { hp_icon = 3; } 
else if (hp <= 0.625 * maxhp && hp > 0.5 * maxhp) { hp_icon = 4; } 
else if (hp <= 0.5 * maxhp && hp > 0.375 * maxhp) { hp_icon = 5; } 
else if (hp <= 0.375 * maxhp && hp > 0.25 * maxhp) { hp_icon = 6; } 
else if (hp <= 0.25 * maxhp && hp > 0.125 * maxhp) { hp_icon = 7; } 
else if (hp <= 0.125 * maxhp && hp > 0) { hp_icon = 8; } 
else if (hp <= 0) { hp_icon = 0; }

if(gui_couinter%3==0){
	gui_hp_counter++;
}

if(gui_hp_counter>7){gui_hp_counter=0;}
vsp += grv;
hook_cd--;

if(hook_cd<=0)
{
	hook_cd=0;
}

if(oPlayer.x>room_width)
{
	var adjust =0;
	oPlayer.x=room_width-200;
	while(place_meeting(x,y,oWall))
	{
	adjust-=50;
	oPlayer.x=adjust;
	}
}

if(oPlayer.x<0)
{
	var adjust =0;
	oPlayer.x=200
	while(place_meeting(x,y,oWall))
	{
	adjust+=50;
	oPlayer.x=adjust;
	}
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
var hold_time = 0;
//jumps
if (keyboard_check(vk_space) && !jumping && jump_current > 0)
{
    // Zwiększanie bieżącej wysokości skoku
    if (current_jump_height < max_jump_height)
    {
        current_jump_height += jump_height_increment;
    }
}
else
{
    // W momencie zwolnienia spacji, wykonaj skok
    if (current_jump_height > 0)
    {
        vsp = -current_jump_height; // Ustaw prędkość skoku
        current_jump_height = 0; // Zresetuj bieżącą wysokość skoku
        jumping = false; // Ustaw flagę skoku na true
        jump_current--; // Zmniejsz liczbę dostępnych skoków
    }
}

// Sprawdź kolizje z podłożem
if (place_meeting(x, y + vsp, oWall))
{
    while (!place_meeting(x, y + sign(vsp), oWall))
    {
        y += sign(vsp);
    }
    if (vsp > 0)
    {
        jump_current = jump_number;
    }
    vsp = 0;
    jumping = false; // Zresetuj flagę skoku po zakończeniu ruchu w górę
}
else
{
    // Aktualizuj pozycję Y
    y += vsp;
}

// Sprawdź, czy gracz stoi na ziemi
if (place_meeting(x, y + 1, oWall))
{
    jumping = false; // Zresetuj flagę skoku, jeśli gracz jest na ziemi
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

if(hsp!=0)
{
	if(step_cd==23)
	{
		audio_play_sound(m_player_running,100,false);
	}
	step_cd--;
	if(step_cd==0){step_cd=23;}
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
if (mouse_check_button_pressed(mb_right) && hook_cd<=0) {
	if(ammo > 0){
		audio_play_sound(m_player_shooting,1,false);
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
	audio_play_sound(m_player_attack,2,false);
    // Iterate through all instances of oEnemy
    with (oEnemy) {
        // Check if the enemy is within the player's attack range
        if (point_distance(x, y, oPlayer.x, oPlayer.y) < oPlayer.attack_range && grabbed==true) {
            // Apply the attack logic to each enemy
			hitted=true;
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
if(!dead_play)
{
	audio_play_sound(m_player_dead,1064,false);
	dead_play=true;
}

sprite_index = sPlayer_dead;
image_speed=0;
image_index=deadcounter;
deadcounter+=0.25;

if (deadcounter >= 20) 
	{
		instance_destroy(oPlayer);
		oTheEnd.game_over=true;	
	}
}

if(hp<maxhp)hp = hp + hp_regen;

