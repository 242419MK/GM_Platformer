// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377'
function load_game_data() {
    if (file_exists("savefile.json")) {
        // Otwieramy plik do odczytu
        var file = file_text_open_read("savefile.json");
        var json_string = file_text_read_string(file);
        file_text_close(file);
        
        // Dekodujemy JSON do struktury danych
        var game_data = json_decode(json_string);
        
        // Pobieramy wartości zmiennych
        var player_name = game_data[? "player_name"];
        var player_score = game_data[? "player_score"];
        
        // Usuwamy strukturę danych
        ds_map_destroy(game_data);
        
        // Zwracamy wartości jako struktura
        return [player_name, player_score];
    } else {
        // Plik nie istnieje, zwracamy wartości domyślne
        return ["", 0];
    }
}
