/// @description aha
// W tym edytorze możesz zapisać swój kod

if(room==Tutorial_Room)
{
	speed=3; 
	death_timer = 120;	
}
else if(room==Level1)
{
	speed=4;
	death_timer = 130;	
}
else if(room==Level2)
{
	speed=5;
	death_timer = 140;	
}
else if(room==Level3 or LevelBoss)
{
	speed=6;
	death_timer = 150;
}

if (instance_exists(oPlayer)) {
direction = point_direction(x, y, oPlayer.x, oPlayer.y-32);
}

timeEnds = false;
damage = 6;