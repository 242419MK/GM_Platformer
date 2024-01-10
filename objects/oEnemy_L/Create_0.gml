/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

grabbed = false;

rage_timer = 30;
rage = false;

// Create Event
randomize(); // Initialize random number generator
spawnpoint_x = x; // Save initial spawn point x-coordinate
spawnpoint_y = y; // Save initial spawn point y-coordinate
speed = 2; // Adjust speed as needed
max_range = 500; // Maximum distance from spawn point
player_range = 300; // Distance to start following the player
follow_speed = 0.1; // Smoothing factor for following the player


fullHp = 200;
hp = fullHp;
dead=false;
