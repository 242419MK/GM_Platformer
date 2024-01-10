// Step Event of oSpawner_enemy
var _enemy_counter = 0;

// Iterate through all instances of oEnemy
with (oEnemy_S) {
    _enemy_counter += 1;
}

// Update the enemy_counter variable
enemy_counter = _enemy_counter;

if(enemy_lvl==0){enemy_max_Number=16;}

if (enemy_counter<enemy_max_Number){
	if (cooldown <= 0) {
	    // Check if there's no oEnemy_S on top of oWall_enemy_S
	    var spawn_x = oWall_enemy_S.x; // Set the spawn point initially to the oWall_enemy_S's x position
	    var spawn_y = oWall_enemy_S.y; // Set the spawn point initially to the oWall_enemy_S's y position

	    if (!place_meeting(spawn_x, spawn_y - oWall_enemy_S.sprite_height, oEnemy_S)) {
	        // Spawn oEnemy_S on top of oWall_enemy_S
	        instance_create_layer(spawn_x, spawn_y - 48, "Enemies", oEnemy_S);

	        // Set cooldown to 10 seconds
	        cooldown = 600; // room_speed is the number of steps per second
	    }
	} else {
	    // Decrease cooldown
	    cooldown -= 1;
	}
}
