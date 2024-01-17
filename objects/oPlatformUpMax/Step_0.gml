// Step Event of oPlatform
x=spawnx;

if (going_up) 
{
	sprite_index = sPlatform_max_up;
    // Move up
    speed=-2

    // Check if the platform has reached the maximum height
    if (y < spawny - max_height) 
	{
        y = spawny - max_height; // Cap the position at max height
        going_up = false; // Change direction to go down
    }
} else 
{
	sprite_index = sPlatform_max_down;
    // Move down
    speed = 2;
	if (place_meeting(x, y-1, oPlayer)) 
	{
		oPlayer.hp -=0.21;
    }
    // Check if the platform has reached the initial position
    if (y > spawny) 
	{
        y = spawny; // Cap the position at the initial position
        going_up = true; // Change direction to go up
    }
}
y += speed;

if (place_meeting(x, y, oPlayer))
{
		oPlayer.y +=speed;
}