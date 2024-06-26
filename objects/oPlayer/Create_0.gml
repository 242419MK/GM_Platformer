//Movement variables
hsp = 0;
vsp = 0;
grv = 0.7;
walksp = 5;
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
step_cd = 23;
//Dash variables
dash_enabled = false;
dash_max_cd = 300;
dash_cd = 0;
dash_length = 50;
//Jumping variables
key_jump = keyboard_check_pressed(vk_space);
double_jump_enabled = false;
max_hold_time = 60;
max_jump_height = 16; // Maksymalna wysokość skoku
jump_height_increment = 2; // Wartość, o którą zwiększa się wysokość skoku co klatkę przytrzymania spacji
jumping = false; // Flaga określająca, czy gracz jest w trakcie skoku
current_jump_height = 0; // Bieżąca wysokość skoku


jump_number =  1; //How many jumps the player can make
jump_current = 0; //How many jumps the player has remaining

lvl = 0;

//Player stats and cd
play = false; //attack animation
player_name = "";
//HP, hp regen and armor
hp_icon=1;
maxhp = 200;
hp = maxhp;
hp_regen = 0.01;
armor = 1;
//Player attack variables
attack_cd = 30;
attack_cd_max = 30;
attack_range = 80;
attack_damage = 51;
//Player hooking variables 
maxAmmo = 1;
ammo = maxAmmo;
hook_cd=10;
hook_speed_bonus = 0;
hook_long_bonus = 0;
grabbing_wall = false;
//Shield timer
shield_timer=300;
shield_counter=0;
//Hearths and cash variables
red_hearths = 0;
blue_hearths = 0;
purple_hearths = 0;
green_hearths = 0;
cash = 200;


//Player damaged and death
deadcounter=0
hit_counter = 10;
start_hit_animation = false;
dead_play=false;


//GUI variables 
gui_couinter = 0;
gui_hp_counter = 0;
entityOnMinimap= true;
menu_cd=60;
overtime = 0;
progress = 0;
progressMax=150;


