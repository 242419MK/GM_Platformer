// Step Event of oPlatform
x=spawnx;

if (going_up) 
{
	sprite_index = sPlatform_max_up;
    speed = -speed_value;

    if (y < spawny - max_height) 
	{
        y = spawny - max_height;
        going_up = false; 
    }
} else 
{
	sprite_index = sPlatform_max_down;
    speed = speed_value;
	if (place_meeting(x, y-1, oPlayer)) 
	{
		oPlayer.hp -=0.2 - 0.5*oPlayer.hp_regen;
    }
    if (y > spawny) 
	{
        y = spawny;
        going_up = true;
    }
}
y += speed;

if (place_meeting(x, y, oPlayer))
{
    oPlayer.y += speed;
}

if (place_meeting(x, y, oHearth))
{
    oHearth.y += speed;
}

with (oEnemy) 
{
    if (place_meeting(x, y, id)) 
    {
        y += speed;
    }
}
