// In Draw GUI Event
draw_self();
draw_set_font(fArial8);
draw_set_color(c_black);

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