// Draw event of the object responsible for drawing the line (e.g., oPlayer or oBullet)
draw_self(); // Draw the object sprite
draw_set_color(c_white)
// Draw a line between the player and the bullet
 if (instance_exists(oPlayer)){
 draw_line(oPlayer.x, oPlayer.y, x, y);
 }

