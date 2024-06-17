function load_and_sort_game_data() {
    var data_array = [];

    if (file_exists("savefile.json")) {
        var file = file_text_open_read("savefile.json");
        var json_string = file_text_read_string(file);
        file_text_close(file);

        var game_data = json_decode(json_string);

        if (is_undefined(game_data) || !is_ds_map(game_data)) {
            return data_array; // Zwracamy pustą tablicę, jeśli dane są niepoprawne
        }

        var keys = ds_map_keys(game_data);
        for (var i = 0; i < array_length(keys); i++) {
            var player_name = keys[i];
            var player_score = game_data[? player_name];
            array_push(data_array, [player_name, player_score]);
        }

        ds_map_destroy(game_data);
    }

    data_array = array_sort(data_array, function(a, b) {
        return b[1] - a[1];
    });

    return data_array;
}
