if(instance_exists(oPlayer))
{
	if(room==Level1)speed=4;
	if(room==Level2)speed=5;
	if(room==Level3)speed=6;
	if(room==LevelBoss)speed=6;
	image_angle +=5;

	if (place_meeting(x, y, oWall)) or (death_timer == 0) {
	    instance_destroy();
	}

	if(timeEnds==true)
	{
		speed = speed + 1;
		death_timer = 10;
	}

	death_timer -= 1;

	if (!place_meeting(x, y, oPlayer) && instance_exists(oPlayer)) {
	    x += lengthdir_x(speed, direction);
	    y += lengthdir_y(speed, direction);
	} else {
		audio_play_sound(m_player_hitted,820,false);
		sprite_index = sEnemy_Projectile2_hit;
	    speed = 0;
	    death_timer = 0;
	    oPlayer.hp -= damage/ oPlayer.armor;
	}

}

