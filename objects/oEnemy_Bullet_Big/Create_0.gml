/// @description aha
// W tym edytorze możesz zapisać swój kod
death_timer = 120;
speed = 4;
if (instance_exists(oPlayer)) {
direction = point_direction(x, y, oPlayer.x, oPlayer.y-32);
}

timeEnds = false;
damage = 6;