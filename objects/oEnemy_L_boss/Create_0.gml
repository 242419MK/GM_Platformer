/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

grabbed = false;

rage_timer = 30;
rage = false;
hit_player = false;
grab_free_time = 120;
hitted = false;
hit_counter = 30;
randomize(); // Initialize random number generator
spawnpoint_x = x; // Save initial spawn point x-coordinate
spawnpoint_y = y; // Save initial spawn point y-coordinate
speed = 2; // Adjust speed as needed
max_range = 500; // Maximum distance from spawn point
player_range = 600; // Distance to start following the player
follow_speed = 0.1; // Smoothing factor for following the player
value = 15;
prevx = x;
attack_adjust = 0;
damage = 10;

fullHp = 200;
hp = fullHp;
hp_buff=false;
dead=false;
sound_played=false;


timeEnds = false;
better_reward = false;

rage_speed = 3;

entityOnMinimap = true;

if(room==Tutorial_Room)
{
    image_xscale = 1.0;
    image_yscale = 1.0;
}
else if(room==Level1)
{
	image_xscale = 1.25;
    image_yscale = 1.25;
}
else if(room==Level2)
{
	image_xscale = 1.37;
    image_yscale = 1.37;
}
else if(room==Level3 or LevelBoss)
{
	image_xscale = 1.5;
    image_yscale = 1.5;
}