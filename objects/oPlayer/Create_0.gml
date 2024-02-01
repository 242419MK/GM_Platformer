hsp = 0;
vsp = 0;
grv = 0.7;
walksp = 4;

maxAmmo = 1;
ammo = maxAmmo;
maxhp = 200;
hp = maxhp;
attack_cd = 30; // Initial attack speed in frames per second
attack_cd_max = 30; // Initial attack speed in frames per second

hood_cd=10;
damaged = false;
attack_range = 80;
attack_damage = 51;
hp_regen = 0.01;
armor = 1;


dash_enabled = false;
double_jump_enabled = false;
jump_height = -18;

red_hearths = 0;
blue_hearths = 0;
purple_hearths = 0;
green_hearths = 0;
cash = 0;

play = false;

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);


jump_number = 2; //How many jumps the player can make
jump_current = 0; //How many jumps the player has remaining

dash_max_cd = 300;
dash_cd = 0;
dash_length = 50;

grabbing_wall = false;
hook_speed_bonus = 0;
hook_long_bonus = 0;
mode = 0;
hit_counter = 10;
start_hit_animation = false;

round_time = 18000; //600 = 10s dla testow 
round_time_bonus = 0;
overtime = 0;

progress = 0;
progressMax=200;



deadcounter=0;
gui_couinter = 0;
gui_hp_counter = 0;

entityOnMinimap= true;