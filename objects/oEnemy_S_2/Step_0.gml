image_speed = 1;

vsp2 = vsp2 + grv2;
if (place_meeting(x, y + vsp2, oWall))
	{
		while(!place_meeting(x, y + sign(vsp2) ,oWall))
		{
			y = y +sign(vsp2);
		}
		vsp2=0;
	}
	
//Attack enemy in close range
if (place_meeting(x, y, oPlayer) && instance_exists(oPlayer)) 
{
    speed = 0;
    rage = true;
    oPlayer.hp -= damage/ oPlayer.armor;
    if (oPlayer.hp < 160) {
        oPlayer.damaged = true;
    }
}

if (rage) 
{
    rage_timer -= 1;
    if (rage_timer == 0) 
	{
		image_speed = 2;
        sprite_index = sEnemy_S_Attack_S2;
        rage_timer = 30;
        rage = false;
    }
} else {
	if(shooting_timer<80)
	{	
		sprite_index = sEnemy_S2;
	}
}

// Shooting logic for the child object

shooting_timer -= 1;
if (shooting_timer <= 0) 
{
	sprite_index = sEnemy_S_Attack_S2;
    // Your custom shooting logic for the child object
	if (instance_exists(oPlayer)&& point_distance(x, y, oPlayer.x, oPlayer.y) < 500)
	{
		if (!collision_line(x, y+10, oPlayer.x, oPlayer.y, oWall, false, true))
		{
			for (var i = 0; i < 3; i++) 
			{
				var adjust = 0;
				if(oPlayer.x<oEnemy_S_2.x){adjust = -32;}
				else {adjust = 32;}
		        var bullet = instance_create_layer(x+adjust, y, "Enemies", oEnemy_Bullet_Big);
				if(timeEnds==true){bullet.timeEnds=true;}
		        // Calculate the direction for each bullet
		        var bulletDirection = point_direction(x, y, oPlayer.x + random_range(-8, 8), oPlayer.y + random_range(-8, 8));

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

if(dead==true)
{
	var reward = instance_create_layer(x, y-50, "Player", oPurpleHearth);
	if(better_reward)
	{
		var reward2 = instance_create_layer(x-20, y-40, "Player", oPurpleHearth);
		var reward3 = instance_create_layer(x+20, y-40, "Player", oPurpleHearth);
	}
	instance_destroy();
}