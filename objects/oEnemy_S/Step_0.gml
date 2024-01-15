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
        sprite_index = sEnemy_S_Attack;
        rage_timer = 30;
        rage = false;
    }
} else {
    sprite_index = sEnemy_S;
}

// Check if the enemy is still holding the player
if (!place_meeting(x, y, oPlayer) and grabbed) {
    grabbed = false;
}

// Shooting logic
shooting_timer -= 1;
if (shooting_timer == 0) {
    // Check if the player exists and is within a distance of less than 800
    if (instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y) < 600) {
        // Check if there are no walls between the enemy and the player before shooting
        if (!collision_line(x, y+10, oPlayer.x, oPlayer.y, oWall, false, true)) {
            var bullet = instance_create_layer(x, y, "Enemies", oEnemy_Bullet);
        }
    }
    shooting_timer = 60;
}


if(dead==true)
{
	var reward = instance_create_layer(x, y-50, "Player", oSilverCoin);
	instance_destroy();
}