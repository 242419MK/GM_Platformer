/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój 

if (!place_meeting(x, y, oPlayer) and grabbed) {
    grabbed = false;
}

// Step Event
if (instance_exists(oPlayer))
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

if(dead==true)
{
	var reward = instance_create_layer(x, y-50, "Player", oGreenHearth);
	instance_destroy();
}