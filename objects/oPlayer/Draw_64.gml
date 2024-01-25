// Draw GUI event of obj_UI
draw_self(); // Draw the object sprite
var textY =7;

var darker_gray = make_color_rgb(100, 100, 100);
var middle_gray = make_color_rgb(150, 150, 150);
var lighter_gray = make_color_rgb(200, 200, 200);

draw_set_color(darker_gray);
draw_rectangle(0, 0, 960, 30, false); //interface rectangle

draw_set_color(middle_gray);
draw_rectangle(5, 7, 76, 25, false);    //hp
draw_rectangle(110, 7, 170, 25, false); //hearths
draw_rectangle(200, 7, 280, 25, false); //cash
draw_rectangle(490, 7, 690, 25, false); //double jump info
draw_rectangle(740, 7, 880, 25, false); //dash info
draw_rectangle(900, 7, 970, 25, false); //ammo

draw_set_color(lighter_gray);
draw_rectangle(290, 7, 455, 25, false); //round time


draw_set_color(c_black);

draw_set_font(fArial12);

var rounded_hp = round(oPlayer.hp / 10) * 10;
draw_text(10, textY, "HP: " + string(rounded_hp));


var hearths_number = oPlayer.red_hearths + oPlayer.blue_hearths + oPlayer.green_hearths + oPlayer.purple_hearths;

for (var i = 0; i < 4; i++) {

if(gui_couinter<=60){sprite = sRedHearth;}
else if(gui_couinter<=120){sprite = sBlueHearth;}
else if(gui_couinter<=180){sprite = sPurpleHearth;}
else if(gui_couinter<=240){sprite = sGreenHearth;	gui_couinter=0}

draw_sprite_ext(sprite,0,150,17,0.5,0.35,0,c_white,1);
draw_text(120, textY, string(hearths_number));
}
var money = cash;
draw_text(200, textY, "$: " + string(money));



var time_M = floor(oPlayer.round_time /60 / 60); // Zaokrąglamy w dół do pełnych minut
var time_S = floor(oPlayer.round_time /60  % 60); // Reszta to sekundy

var timeO_M = floor(oPlayer.overtime /60 / 60); // Zaokrąglamy w dół do pełnych minut
var timeO_S = floor(oPlayer.overtime /60  % 60); // Reszta to sekundy

var time_text ="Round time: " +  string(time_M) + ":" + string(time_S); // Dodajemy zero przed sekundy, jeśli są jednocyfrowe
var time_text2 ="Over time! : " +  string(timeO_M) + ":" + string(timeO_S); // Dodajemy zero przed sekundy, jeśli są jednocyfrowe



if(overtime<=0){
draw_set_color(c_black);
draw_text(300, textY, time_text);
}
else
{
draw_set_color(c_red);
draw_text(300, textY, time_text2);
}

draw_set_color(darker_gray);
if(room=Upgrades)
{
draw_rectangle(270, 0, 480, 25, false); //round time
}

draw_set_color(c_black);
var jump = "chuj";
if(oPlayer.double_jump_enabled==true){jump="active";}
else {jump="inactive"};
draw_text(500, textY, "Double jump: " + jump);


var dash = "chuj";
if(oPlayer.dash_enabled==true){dash="active";}
else {dash="inactive"};
draw_text(750, textY, "Dash: " + dash);



var ammunation = ammo;
draw_text(900, textY,"Ammo:" + string(ammunation));



// Reset the draw color
draw_set_color(c_black);
