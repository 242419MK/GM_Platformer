// Draw Event of oEnemy (or whatever object you're using for enemies)
draw_self(); // Draw the enemy sprite or any other necessary visuals

// Calculate the width of the health bar based on the percentage of health
var healthPercentage = clamp(hp / fullHp, 0, 1); // Ensure the percentage is between 0 and 1
var barWidth = 40; // Set the width of the health bar
var barHeight = 2; // Set the height of the health bar

// Calculate the width of the red portion of the health bar
var healthBarWidth = barWidth * healthPercentage;

// Set the color for the background (black)
var middle_gray = make_color_rgb(150, 150, 150);
draw_set_color(middle_gray);
draw_rectangle(x - barWidth / 2, y - 90, x + barWidth / 2, y - 95, false);

// Set the color for the health portion (red)
draw_set_color(c_red);
draw_rectangle(x - barWidth / 2, y - 90, x - barWidth / 2 + healthBarWidth, y - 95, false);

// Reset the draw color
draw_set_color(c_white);
