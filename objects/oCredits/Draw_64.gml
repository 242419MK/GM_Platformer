// In Draw GUI Event
draw_self();
draw_set_font(fArial18);
draw_set_color(c_black);


var licence1 = "battle.wav by levelclearer -- https://freesound.org/s/346200/ -- License: Attribution 4.0"

var licence2="80s Loop #1 by danlucaz -- https://freesound.org/s/497109/ -- License: Creative Commons 0"

var licence3="electric woosh by HadaHector -- https://freesound.org/s/446383/ -- License: Attribution 4.0"

var licence4="EnergyShield.mp3 by Beussa -- https://freesound.org/s/659967/ -- License: Creative Commons 0"

draw_text(240, 30, "Credits to all sounds and music used in game");

draw_set_font(fArial8);
draw_set_color(c_black);

draw_text(240, 60, licence1);
 
draw_text(240, 80, licence2);

draw_text(240, 100, licence3);

draw_text(240, 120, licence4);

/*
var max_column_number = 10; // Example value
var jump = 20; // Example value for spacing

var data_array = global.sorted_game_data;

for (var i = 0; i < max_column_number; i++) {
    var player_name = "";
    var player_score = "";

    if (i < array_length(data_array)) {
        player_name = data_array[i][0];
        player_score = string(data_array[i][1]);
    }

    draw_text(240, 56 + i * jump, string(i + 1));
    draw_text(270, 56 + i * jump, player_name);
    draw_text(370, 56 + i * jump, player_score);
}

var i2 = 0;
for (var j = 26; j < 26 + max_column_number; j++) {
    var player_name2 = "";
    var player_score2 = "";

    if (j < array_length(data_array)) {
        player_name2 = data_array[j - 26][0]; // Corrected index to match the right data
        player_score2 = string(data_array[j - 26][1]);
    }

    draw_text(520, 56 + i2 * jump, string(j));
    draw_text(550, 56 + i2 * jump, player_name2);
    draw_text(650, 56 + i2 * jump, player_score2);
    i2++;
}
*/