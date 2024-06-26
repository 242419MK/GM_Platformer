/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_self()

// Calculate the width of the health bar based on the percentage of health
var healthPercentage = clamp(boss_hp / boss_hp_max, 0, 1); // Ensure the percentage is between 0 and 1
var barWidth = 200; // Set the width of the health bar
var barHeight = 10; // Set the height of the health bar

// Calculate the width of the red portion of the health bar
var healthBarWidth = barWidth * healthPercentage;

// Set the color for the background (black)
var middle_gray = make_color_rgb(150, -120, 150);
draw_set_color(middle_gray);
draw_rectangle(x - barWidth / 2, y - 120, x + barWidth / 2, y - 100, false);

// Set the color for the health portion (red)
draw_set_color(c_red);
draw_rectangle(x - barWidth / 2, y - 120, x - barWidth / 2 + healthBarWidth, y - 100, false);

// Reset the draw color
draw_set_color(c_white);