image_angle +=1;

if (place_meeting(x, y, oWall)) or (death_timer == 0) {
    instance_destroy();
}

if(timeEnds==true)
{
	speed = 7;
	death_timer = 10;
}

death_timer -= 1;

if (!place_meeting(x, y, oPlayer)) {
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
} else {
	audio_play_sound(m_player_hitted,800,false);
	sprite_index = sEnemy_Projectile_hit;
    speed = 0;
    death_timer = 0;
    oPlayer.hp -= damage/oPlayer.armor;
}

