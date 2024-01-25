if (!instance_exists(oPlayer))
{
	instance_destroy();
}

if (instance_exists(oPlayer))
{
	var direction_to_rotate = point_direction(oPlayer.x, oPlayer.y, x, y)-90;
	image_angle = direction_to_rotate;
}

image_xscale = 0.5;
image_yscale = 0.5;
image_speed = 0;


// Jeśli kula nie ma jeszcze ustawionego kierunku i prędkości
if (!direction_set and instance_exists(oPlayer))
{
    // Kierunek ruchu kuli w momencie utworzenia (stały)
    direction = point_direction(x, y, oCrosshair.x, oCrosshair.y);
    speed = 10 + speed_bonus;
    direction_set = true;
}


if (place_meeting(x, y, oWall))
{	
	 if (instance_exists(oPlayer))
	 {
		speed = 10 + speed_bonus;
		direction = point_direction(x, y, oPlayer.x, oPlayer.y); // Change direction to player
	 }
} 
else {
    // Sprawdzenie kolizji z wrogiem
    var hit_enemy = instance_place(x, y, oEnemy);
    var attached_enemy = hit_enemy;
    if (hit_enemy != noone) {
        // Sprawdzenie, czy kulka jeszcze nie jest przyczepiona do wroga
        if (!attached_to_enemy) 
			{
			if(attached_enemy.hp==attached_enemy.fullHp)
				{
					attached_enemy.hp = oPlayer.attack_damage-1;
				}
		        // Przyczepienie kulki do wroga
		        attached_to_enemy = true;
		        attached_enemy.grabbed = true;
		        attached_enemy.original_direction = attached_enemy.direction; // Store the original direction
			}
	        // Uruchomienie mechaniki przyciągania wroga do gracza
	        attached_enemy.speed = 10 + speed_bonus; // Prędkość przyciągania wroga (możesz dostosować)
	        attached_enemy.direction = point_direction(attached_enemy.x, attached_enemy.y, oPlayer.x, oPlayer.y - 24);
	   }
        // Jeśli kulka jest przyczepiona do wroga, przyciągnij wroga w kierunku gracza
        if (attached_to_enemy)
			{
			if(death_flag)
				{
				attached_enemy.speed = 10 + speed_bonus; // Prędkość przyciągania wroga (możesz dostosować)
		        attached_enemy.direction = point_direction(attached_enemy.x, attached_enemy.y, oPlayer.x, oPlayer.y);
				}
			}
     }

    // Sprawdzenie kolizji z obiektami i zniszczenie kuli
    if (place_meeting(x, y, oEnemy) && attached_to_enemy && instance_exists(oPlayer)) 
	{
		 image_speed=5;
		 sprite_index=sHook_hit;
         direction = point_direction(x, y, oPlayer.x, oPlayer.y); // Adjust direction to player
    }
	else if (!place_meeting(x, y, oEnemy)) 
		{
        destroy_timer -= 1;
        if (destroy_timer <= 0 && instance_exists(oPlayer)) 
			{
            direction = point_direction(x, y, oPlayer.x, oPlayer.y); // Adjust direction to player
			}
		}
	if (instance_exists(oPlayer)) 
	{
	    if (point_distance(x, y, oPlayer.x, oPlayer.y) < 10) 
		{
	        instance_destroy();
			attached_to_enemy = false;
			death_flag = true;
	        oPlayer.ammo +=1;
	    }
    }
