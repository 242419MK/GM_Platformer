image_angle +=5;

if (place_meeting(x, y, oWall)) or (death_timer == 0) {
    instance_destroy();
}

if(timeEnds==true)
{
	speed = 6;
	death_timer = 10;
}

death_timer -= 1;

if (!place_meeting(x, y, oPlayer) && instance_exists(oPlayer)) {
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
} else {
    speed = 0;
    death_timer = 0;
    oPlayer.hp -= damage/ oPlayer.armor;

    if (oPlayer.hp < 160) {
        oPlayer.damaged = true;
    }
}

