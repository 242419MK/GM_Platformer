//Movement and wall collisions
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;
hsp = move * walksp;
dash_cd-=1;
vsp += grv;

	if(double_jump_enabled)
		{
		if(keyboard_check_pressed(vk_space) && jump_current > 0)
			{
				vsp = -15;
				jump_current--;
			}
		if(place_meeting(x, y + vsp, oWall))
			{
				while(!place_meeting(x, y + sign(vsp), oWall))
				{
				    y += sign(vsp);
				}
					if(vsp > 0)
					{
					    jump_current = jump_number;
					}
				vsp = 0;
			}
			y = y + vsp;
			}
	else {
		if (place_meeting(x, y + 1 , oWall)) && (key_jump)
			{
				vsp = -15;
			}
		if (place_meeting(x, y + vsp, oWall))
		{
			while(!place_meeting(x, y+sign(vsp), oWall))
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}
		y = y + vsp;
	}


//horizontal movement and collisions
if (place_meeting(x+hsp, y, oWall))
{
	while(!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;




//Animation
if(!place_meeting(x,y+1,oWall))
{		
		if (play)
		{
			image_speed = 1.4;
		    sprite_index = sPlayerAttack;
		    if (image_index >= image_number - 1) 
			{
		        play = false; // Set play to false when animation ends
			}
		}
		//przez to powyżej z jakiegoś powodu postać atakując będąc obok ściany zatrzymuje się,
		// przez co może sie wspinać double jumpem
		//feature czy bug?
		//jak feature to by wypadało zrobić osobnego spritea
		//jak bug to trzeba naprawić
		else 
		{
			sprite_index = sPlayerA;
			image_speed = 0;
			if (sign(vsp) > 0 )
			{
				image_index = 1; 
			}
			else
			{
				image_index = 0;
			} 
		}

}

if(place_meeting(x,y+1,oWall))
{
	image_speed = 0.3;
	if (hsp == 0)
	{
		if (play)
		{
			image_speed = 1.4;
		    sprite_index = sPlayerAttack;
		    if (image_index >= image_number - 1) {
		        play = false; // Set play to false when animation ends
		    }
		}
		else 
		{
			sprite_index = sPlayer;
		}
	}
	else
	{
		if (play)
		{
			image_speed = 1.4;
		    sprite_index = sPlayerAttack;
		    if (image_index >= image_number - 1) {
		        play = false; // Set play to false when animation ends
		    }
		}
		else 
		{
			sprite_index = sPlayerR;
		}
	}
}

if(hsp !=0) image_xscale = sign(hsp);



//hook
if (mouse_check_button_pressed(mb_right)) {
	if(ammo > 0){
	    // Stworzenie kuli na pozycji gracza
	    var bullet = instance_create_layer(x, y, "Player", oBullet);

	    var start_x = x;
	    var start_y = y;
	    var dir = point_direction(start_x, start_y, oCrosshair.x, oCrosshair.y);
	    bullet.direction = dir;
	    bullet.speed = 15;
	    bullet.x = start_x + lengthdir_x(30, dir); // 30 to odległość od gracza, możesz dostosować
	    bullet.y = start_y + lengthdir_y(30, dir); // 30 to odległość od gracza, możesz dostosować

	    ammo -= 1; // opóźnienie w klatkach
	}
}


attack_cd-=1;
//attack
if (mouse_check_button_pressed(mb_left) && attack_cd <= 0) {
	play = true; //attack animation
	
    var hitted_enemy = noone; // Initialize to no enemy hitted

    // Iterate through all instances of oEnemy
    with (oEnemy) 
	{
        if (point_distance(x, y, oPlayer.x, oPlayer.y) < oPlayer.attack_range) 
		{
            hitted_enemy = id;
        }
    }

    if (hitted_enemy != noone) 
	{
		hitted_enemy.hp-=attack_damage;
		if(hitted_enemy.hp<0)
		{
		hitted_enemy.dead=true;
		} 
    }
	
	 var hitted_chest = noone; // Initialize to no enemy hitted
	 with (oChest) 
	 {
        if (point_distance(x, y, oPlayer.x, oPlayer.y) < oPlayer.attack_range) 
		{
			hitted_chest = id;
			hitted_chest.state -=1;
        }
    }
	
	attack_cd=attack_cd_max;
}


if(hp<0){
instance_destroy(oPlayer);
}

if(hp<maxhp)hp = hp + hp_regen;

