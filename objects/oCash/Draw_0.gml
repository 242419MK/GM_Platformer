/// @description Rysowanie przychodu gracza


draw_set_color(c_black);
draw_set_font(fArial32);

draw_text(x-80,y-20,string(number1));
var red = sRedHearth;
draw_sprite_ext(red,0,x-20,y,0.5,0.5,0,c_white,1);
draw_text(x-5,y-20,"+");


draw_text(x+20,y-20,string(number2));
var blue = sBlueHearth;
draw_sprite_ext(blue,0,x+80,y,0.5,0.5,0,c_white,1);
draw_text(x+95,y-20,"+");

draw_text(x+120,y-20,string(number3));
var purple = sPurpleHearth;
draw_sprite_ext(purple,0,x+180,y,0.5,0.5,0,c_white,1);
draw_text(x+195,y-20,"+");

draw_text(x+220,y-20,string(number4));
var green = sGreenHearth;
draw_sprite_ext(green,0,x+280,y,0.5,0.5,0,c_white,1);

draw_text(x+300,y-20,"=");
draw_text(x+325,y-20,string(cashout));

