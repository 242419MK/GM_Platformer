if (place_meeting(x, y, oWall)) or (death_timer == 0) {
    instance_destroy();
}

death_timer -= 1;

if (!place_meeting(x, y, oPlayer)) {
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
} else {
    speed = 0;
    death_timer = 0;
    oPlayer.hp -= 10;

    if (oPlayer.hp < 160) {
        oPlayer.damaged = true;
    }
}

