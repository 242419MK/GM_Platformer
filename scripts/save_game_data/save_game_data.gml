function save_game_data(player_name, player_score) {
    // Tworzymy strukturę danych do zapisania
    var game_data = ds_map_create();
    ds_map_add(game_data, "player_name", player_name);
    ds_map_add(game_data, "player_score", player_score);
    
    // Konwertujemy strukturę danych do formatu JSON
    var json_string = json_encode(game_data);
    
    // Otwieramy plik do zapisu
    var file = file_text_open_write("savefile.json");
    file_text_write_string(file, json_string);
    file_text_close(file);
    
    // Usuwamy strukturę danych
    ds_map_destroy(game_data);
}
