/// @description Rysowanie przychodu gracza


draw_set_color(c_black);
draw_set_font(fArial32);

draw_text(x-60,y-20,string(number1));
var red = sRedHearth;
draw_sprite_ext(red,0,x-20,y-25,0.5,0.5,0,c_white,1);
draw_text(x+5,y-20,"+");


draw_text(x+40,y-20,string(number2));
var blue = sBlueHearth;
draw_sprite_ext(blue,0,x+90,y-25,0.5,0.5,0,c_white,1);
draw_text(x+115,y-20,"+");

draw_text(x+150,y-20,string(number3));
var purple = sPurpleHearth;
draw_sprite_ext(purple,0,x+195,y-25,0.5,0.5,0,c_white,1);
draw_text(x+225,y-20,"+");

draw_text(x+260,y-20,string(number4));
var green = sGreenHearth;
draw_sprite_ext(green,0,x+300,y-25,0.5,0.5,0,c_white,1);

draw_text(x+330,y-20,"=");
draw_text(x+420,y-20,string(cashout));

