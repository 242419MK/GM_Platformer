/// @description aha
// W tym edytorze możesz zapisać swój kod
death_timer = 60;

speed = 6;
if (instance_exists(oPlayer)) {
direction = point_direction(x, y, oPlayer.x, oPlayer.y-32 );
}
damage = 5;
timeEnds = false;