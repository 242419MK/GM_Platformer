// Draw GUI event of obj_UI
draw_self(); // Draw the object sprite

// Set the color for the background rectangle
var lighter_gray = make_color_rgb(200, 200, 200);
draw_set_color(lighter_gray); // Change c_gray to the desired background color

// Draw a background rectangle
draw_rectangle(0, 0, 960, 30, false); // Adjust the dimensions as needed

// Reset the color to the default
draw_set_color(c_white);

// Calculate rounded HP to the nearest multiple of 10
var rounded_hp = round(oPlayer.hp / 10) * 10;

// Print player rounded HP in the top-left corner of the screen
draw_text(10, 10, "HP: " + string(rounded_hp));


var hearths_number = oPlayer.red_hearths + oPlayer.blue_hearths + oPlayer.green_hearths + oPlayer.purple_hearths;
draw_text(150, 10, "Hearths: " + string(hearths_number));

// Znajdujemy wartości minut i sekund
var time_M = floor(oPlayer.round_time /60 / 60); // Zaokrąglamy w dół do pełnych minut
var time_S = floor(oPlayer.round_time /60  % 60); // Reszta to sekundy

var money = cash;
draw_text(300, 10, "$: " + string(money));
var timeO_M = floor(oPlayer.overtime /60 / 60); // Zaokrąglamy w dół do pełnych minut
var timeO_S = floor(oPlayer.overtime /60  % 60); // Reszta to sekundy
// Formatujemy tekst
var time_text ="Round time: " +  string(time_M) + ":" + string(time_S); // Dodajemy zero przed sekundy, jeśli są jednocyfrowe
var time_text2 ="Over time! : " +  string(timeO_M) + ":" + string(timeO_S); // Dodajemy zero przed sekundy, jeśli są jednocyfrowe

if(overtime<=0){
draw_set_color(c_black);
draw_text(400, 10, time_text);
}
else
{
draw_set_color(c_red);
draw_text(400, 10, time_text2);
}



draw_set_color(c_white);

var ammunation = ammo;
draw_text(800, 10,"Ammo:" + string(ammunation));



// Reset the draw color
draw_set_color(c_white);
