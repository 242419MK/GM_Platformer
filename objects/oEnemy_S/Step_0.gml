//Attack enemy in close range
image_speed = 1;

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
if (shooting_timer <= 0 && !grabbed) 
{
	sprite_index = sEnemy_S_Attack;
    if (instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y) < 600) 
	{
        // Check if there are no walls between the enemy and the player before shooting
        if (!collision_line(x, y+10, oPlayer.x, oPlayer.y, oWall, false, true)) 
		{
			var adjust = 0;
			if(oPlayer.x<oEnemy_S.x){adjust = -32;}
				else {adjust = 32;}
			
            var bullet = instance_create_layer(x+adjust, y, "Enemies", oEnemy_Bullet);
			if(timeEnds==true){bullet.timeEnds=true;}
        }
			shooting_timer = 120;
		if(timeEnds)
		{
			shooting_timer = 60;
		}
    }
    
}


if(dead==true)
{
	var reward = instance_create_layer(x, y-30, "Player", oBlueHearth);
	if(better_reward)
	{
		var reward2 = instance_create_layer(x-20, y-20, "Player", oBlueHearth);
		var reward3 = instance_create_layer(x+20, y-20, "Player", oBlueHearth);
	}
	instance_destroy();
}

if(hitted)
{
	sprite_index = sEnemy_S_hit;
	hit_counter--;
	if(hit_counter<=0)
	{
		hit_counter=30;
		hitted=false;
	}
}