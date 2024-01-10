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

damaged = false;
attack_range = 80;
attack_damage = 51;

dash_enabled = false;
double_jump_enabled = false;

gold = 0;
silver = 0;
bronze = 0;

play = false;

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);


jump_number     = 2; //How many jumps the player can make
jump_current    = 0; //How many jumps the player has remaining
dash_cd = 0;

hp_regen = 0.01;

grabbing_wall = false;
mode = 0;
