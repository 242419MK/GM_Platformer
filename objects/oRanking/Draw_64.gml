/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_self();
draw_set_font(fArial8)
draw_set_color(c_black);
for (var i = 0; i <= max_column_number; i++) {
    draw_text(240, 56 + i * jump, string(i+1));
    draw_text(270, 56 + i * jump, "test");
    draw_text(370, 56 + i * jump, "2137");
}
var i2 = 0;
for (var j = 26; j <= max_column_number * 2; j++) {
	
    draw_text(520, 56 + i2 * jump, string(j));
    draw_text(550, 56 + i2 * jump, "test");
    draw_text(650, 56 + i2 * jump, "2137");
	i2++;
}