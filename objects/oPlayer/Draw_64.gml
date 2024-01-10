// Draw GUI event of obj_UI
draw_self(); // Draw the object sprite

// Set the color for the background rectangle
var lighter_gray = make_color_rgb(200, 200, 200);
draw_set_color(lighter_gray); // Change c_gray to the desired background color

// Draw a background rectangle
draw_rectangle(0, 0, 700, 30, false); // Adjust the dimensions as needed

// Reset the color to the default
draw_set_color(c_white);

// Calculate rounded HP to the nearest multiple of 10
var rounded_hp = round(oPlayer.hp / 10) * 10;

// Print player rounded HP in the top-left corner of the screen
draw_text(10, 10, "HP: " + string(rounded_hp));

var v_gold = oPlayer.gold;
draw_text(100, 10, "Gold: " + string(v_gold));
var v_silver = oPlayer.silver;
draw_text(200, 10, "Silver: " + string(v_silver));
var v_bronze = oPlayer.bronze;
draw_text(300, 10, "Bronze: " + string(v_bronze));


// Reset the draw color
draw_set_color(c_white);

draw_text(410, 10, "mode: " + string(oPlayer.mode));
// Draw Event of oEnemy (or whatever object you're using for enemies)


