//Attack enemy in close range
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
	
	
if (place_meeting(x, y, oPlayer)) {
    speed = 0;
    rage = true;
    oPlayer.hp -= 0.2;
    if (oPlayer.hp < 160) {
        oPlayer.damaged = true;
    }
}

if (rage) {
    rage_timer -= 1;
    if (rage_timer == 0) {
		image_speed = 2;
        sprite_index = sEnemy_S_Attack;
        rage_timer = 30;
        rage = false;
    }
} else {
	if(shooting_timer<80)
	{	
		sprite_index = sEnemy_S;
	}
}

// Check if the enemy is still holding the player
if (!place_meeting(x, y, oPlayer) and grabbed) {
    grabbed = false;
}

// Shooting logic
shooting_timer -= 1;
if (shooting_timer <= 0) {
	
	sprite_index = sEnemy_S_Attack;

	// Check if the player exists and is within a distance of less than 800
    if (instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y) < 600) {
        // Check if there are no walls between the enemy and the player before shooting
        if (!collision_line(x, y+10, oPlayer.x, oPlayer.y, oWall, false, true)) {
			var adjust = 0;
			if(oPlayer.x<oEnemy_S.x){adjust = -32;}
				else {adjust = 32;}
            var bullet = instance_create_layer(x+adjust, y, "Enemies", oEnemy_Bullet);
        }
		shooting_timer = 120;
    }
    
}


if(dead==true)
{
	var reward = instance_create_layer(x, y-50, "Player", oBlueHearth);
	instance_destroy();
}