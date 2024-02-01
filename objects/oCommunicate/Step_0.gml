if (instance_exists(oPlayer))
{
    x = oCamera.x - 90;
    y = oCamera.y - 200;


		
	if (show )
    {
        if (timer > 0)
        {
            timer--;
			visible = true;
        }
		
		if (timer <= 0)
        {
            visible = false;
            show = false;
			timer = 180;
        }
    }


    // Check and set sprite based on overtime
    if ((oPlayer.overtime > 0 && oPlayer.overtime < 60))
    {
        show = true;
        sprite_index = sOvertime_START;
    }
    else if (oPlayer.overtime >= 1200 && oPlayer.overtime < 1380)
    {
        show = true;
        sprite_index = sOvertime_20S;
    }
    else if (oPlayer.overtime >= 3000 && oPlayer.overtime <3180)
    {
        show = true;
        sprite_index = sOvertime_50S;
    }
    else if (oPlayer.overtime >= 3600 && oPlayer.overtime<3780)
    {
        show = true;
        sprite_index = sOvertime_1min;
		oLetsKill.start=true;
    }
	
	


}