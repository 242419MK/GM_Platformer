//Attack enemy in close range
if (place_meeting(x, y, oPlayer)) {
    speed = 0;
    rage = true;
    oPlayer.hp -= 1;
    if (oPlayer.hp < 160) {
        oPlayer.damaged = true;
    }
}

if (rage) {
    rage_timer -= 1;
    if (rage_timer == 0) {
        sprite_index = sEnemy_S_Attack_S2;
        rage_timer = 30;
        rage = false;
    }
} else {
    sprite_index = sEnemy_S2;
}

// Shooting logic for the child object
shooting_timer -= 1;
if (shooting_timer <= 0) {
    // Your custom shooting logic for the child object
	if (instance_exists(oPlayer)&& point_distance(x, y, oPlayer.x, oPlayer.y) < 500)
	{
		if (!collision_line(x, y+10, oPlayer.x, oPlayer.y, oWall, false, true))
		{
			for (var i = 0; i < 3; i++) 
			{
		        var bullet = instance_create_layer(x, y, "Enemies", oEnemy_Bullet_Big);

		        // Calculate the direction for each bullet
		        var bulletDirection = point_direction(x, y, oPlayer.x + random_range(-8, 8), oPlayer.y + random_range(-8, 8));

		        // Slightly adjust the direction for the second and third bullets
		        if (i == 1) {
		            bulletDirection += 15; // Adjust as needed
		        } else if (i == 2) {
		            bulletDirection -= 15; // Adjust as needed
		        }
				bullet.direction = bulletDirection;	
		    }
			
		}
	}
    shooting_timer = 120; // Reset the timer for the next shot
}

if(dead==true)
{
	var reward = instance_create_layer(x, y-50, "Player", oSilverCoin);
	instance_destroy();
}