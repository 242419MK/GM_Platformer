draw_self();
// Calculate the width of the health bar based on the percentage of health
var healthPercentage = clamp(hp / maxhp, 0, 1); // Ensure the percentage is between 0 and 1
var barWidth = 40; // Set the width of the health bar
var barHeight = 2; // Set the height of the health bar

// Calculate the width of the red portion of the health bar
var healthBarWidth = barWidth * healthPercentage;

// Set the color for the background (black)
draw_set_color(c_black);
draw_rectangle(x - barWidth / 2, y - 50, x + barWidth / 2, y - 45, false);

// Set the color for the health portion (red)
draw_set_color(c_red);
draw_rectangle(x - barWidth / 2, y - 50, x - barWidth / 2 + healthBarWidth, y - 45, false);

// Reset the draw color
draw_set_color(c_white);
