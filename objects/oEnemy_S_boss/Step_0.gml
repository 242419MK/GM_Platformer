//Attack enemy in close range
image_speed = 0.8;
image_xscale = 1.5;
image_yscale = 1.5;

//wall collisions 
vsp2 = vsp2 + grv2;
if (place_meeting(x, y + vsp2, oWall))
{
	while(!place_meeting(x, y + sign(vsp2) ,oWall))
	{
		y = y +sign(vsp2);
	}
	vsp2=0;
}

//fall if not grabbed
if(!grabbed)
{
y = y + vsp2;
}

	
//atak melle
if (place_meeting(x, y, oPlayer) && instance_exists(oPlayer) && !grabbed && !hitted) 
{
    speed = 0;
    sprite_index = sEnemy_S_Attack;

    if (rage_timer == 0) // Sprawdź, czy timer osiągnął dokładnie 12
    {
		audio_play_sound(m_enemy_attack3,1200,false);
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

//normal sprite when cd
if(shooting_timer<80)
{
	{	
		sprite_index = sEnemy_S;
	}
}

//enemy being grabbed
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

// Shooting logic
shooting_timer -= 1;
if (shooting_timer <= 0 && !grabbed && !hitted) 
{
	//audio_play_sound(enemy_attack3,1200,false);//
	sprite_index = sEnemy_S_Attack;
    if (instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y)<1100) 
	{
        // Check if there are no walls between the enemy and the player before shooting
       if (!collision_line(x, y-5, oPlayer.x, oPlayer.y, oWall, false, true)) 
		{
			var adjust = 0;
			if(oPlayer.x<x){adjust = -32;}
				else {adjust = 32;}
			
            var bullet = instance_create_layer(x+adjust, y-10, "Enemies", oEnemy_Bullet);
			if(timeEnds==true){bullet.timeEnds=true;}
        }
			shooting_timer = 120;
		if(timeEnds)
		{
			shooting_timer = 60;
		}
   }
    
}

if(timeEnds)
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
	oPlayer.blue_hearths+=1;
	oPlayer.progress+=value;
	instance_destroy();
}

		

if(dead==true)
{
	oPlayer_info.enemies_killed=oPlayer_info.enemies_killed+1;
	//var reward = instance_create_layer(x, y-30, "Player", oBlueHearth);
	if(grabbed)
	{
		var reward2 = instance_create_layer(x+20, y-20, "Player", oBlueHearth);
	}
	if(better_reward)
	{
		var reward3 = instance_create_layer(x-20, y-20, "Player", oBlueHearth);
	}
	oBOSS.boss_hp-=12;
	instance_destroy();
}

if(hitted)
{
	if(!sound_played)
	{
		audio_play_sound(m_enemy_hitted,1000,false);	
		sound_played=true;
	}
	sprite_index = sEnemy_S_hit;
	hit_counter--;
	if(hit_counter<=0)
	{
		hit_counter=30;
		hitted=false;
		sound_played=false;
	}
}

