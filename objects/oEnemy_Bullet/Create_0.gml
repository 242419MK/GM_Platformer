/// @description aha
// W tym edytorze możesz zapisać swój kod
if(room==Tutorial_Room)
{
	speed=4; 
	death_timer = 60;	
}
else if(room==Level1)
{
	speed=5;
	death_timer = 70;	
}
else if(room==Level2)
{
	speed=6;
	death_timer = 80;	
}
else if(room==Level3 or LevelBoss)
{
	speed=6;
	death_timer = 90;
}

if (instance_exists(oPlayer)) {
direction = point_direction(x, y, oPlayer.x, oPlayer.y-32 );
}

damage = 5;
timeEnds = false;