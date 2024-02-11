image_speed = 1;
image_xscale = 2;
image_yscale = 2;

vsp2 = vsp2 + grv2;
if (place_meeting(x, y + vsp2, oWall))
	{
		while(!place_meeting(x, y + sign(vsp2) ,oWall))
		{
			y = y +sign(vsp2);
		}
		vsp2=0;
	}
	

if(!grabbed)
{
y = y + vsp2;
}

	
//atak melle
if (place_meeting(x, y, oPlayer) && instance_exists(oPlayer) && !grabbed) 
{
    speed = 0;
    sprite_index = sEnemy_S_Attack_S2;

    if (rage_timer == 0) // Sprawdź, czy timer osiągnął dokładnie 12
    {
		audio_play_sound(m_enemy_attack2,1210,false);
		audio_play_sound(m_player_hitted,100,false);
        oPlayer.hp -= damage / oPlayer.armor;
		oPlayer_hit_melle.show = true;
		hit_player=true;
		rage_timer=60;
    }
	
	if(hit_player)
	{
		oPlayer.sprite_index = sPlayer_hit;
		if(rage_timer==30){hit_player=false;}
	}

    rage_timer--; 
}  

if(shooting_timer<80)
{
	{	
		sprite_index = sEnemy_S2;
	}
}

// Check if the enemy is still holding the player
if(grabbed)
{
	sprite_index = sEnemy_S_hooked;
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

// Shooting logic for the child object

shooting_timer -= 1;
if (shooting_timer <= 0 && !grabbed && !hitted) 
{
	//audio_play_sound(enemy_attack2,1210,false);  //nie działa
	sprite_index = sEnemy_S_Attack_S2;
	if (instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y)<500) 
	{
		if (!collision_line(x, y-10, oPlayer.x, oPlayer.y, oWall, false, true))
		{
			audio_play_sound(m_enemy_attack3,720,false);
			for (var i = 0; i < 3; i++) 
			{
				var adjust = 0;
				if(oPlayer.x<oEnemy_S_2.x){adjust = -32;}
				else {adjust = 32;}
		        var bullet = instance_create_layer(x+adjust, y-32, "Enemies", oEnemy_Bullet_Big);
				if(timeEnds==true){bullet.timeEnds=true;}
		        // Calculate the direction for each bullet
		        var bulletDirection = point_direction(x, y-32, oPlayer.x + random_range(-8, 8), oPlayer.y + random_range(-8, 8));

		        // Slightly adjust the direction for the second and third bullets
		        if (i == 1) {
		            bulletDirection += 22; // Adjust as needed
		        } else if (i == 2) {
		            bulletDirection -= 22; // Adjust as needed
		        }
				bullet.direction = bulletDirection;	
		    }
			 shooting_timer = 120; // Reset the timer for the next shot
			 if(timeEnds==true){shooting_timer = 60;}
		}
	}
   
}

 if(timeEnds==true)
 {
	if(!hp_buff)
	{
		fullHp=200;
		hp=fullHp;
		hp_buff=true;	
	}
}


if(x>room_width || x<0 || y<0 || y>room_height)
{
	oPlayer.purple_hearths+=1;
	oPlayer.progress+=value;
	instance_destroy();
}


if(dead==true)
{
	var reward = instance_create_layer(x, y-30, "Player", oPurpleHearth);
	if(grabbed)
	{
		var reward2 = instance_create_layer(x+20, y-20, "Player", oPurpleHearth);
	}
	if(better_reward)
	{
		var reward3 = instance_create_layer(x-20, y-20, "Player", oPurpleHearth);
	}
	instance_destroy();
}


if(hitted)
{
	if(!sound_played)
	{
		audio_play_sound(m_enemy_hitted,1000,false);	
		sound_played=true;
	}
	sprite_index = sEnemy_S2_hit;
	hit_counter--;
	if(hit_counter<=0)
	{
		hit_counter=30;
		hitted=false;
		sound_played=false;
	}
}