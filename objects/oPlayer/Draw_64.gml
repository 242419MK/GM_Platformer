// Draw GUI event of obj_UI

draw_self(); // Draw the object sprite

var textY =7;

var darker_gray = make_color_rgb(100, 100, 100);
var middle_gray = make_color_rgb(150, 150, 150);
var lighter_gray = make_color_rgb(200, 200, 200);
var red = make_color_rgb(255, 0, 0);

draw_set_color(darker_gray);
draw_rectangle(0, 0, 960, 30, false); //interface rectangle

draw_set_color(middle_gray);
draw_rectangle(5, 7, 76, 25, false);    //hp
draw_rectangle(110, 7, 170, 25, false); //hearths
draw_rectangle(200, 7, 280, 25, false); //cash
//draw_rectangle(490, 7, 690, 25, false); //double jump info
//draw_rectangle(740, 7, 880, 25, false); //dash info
//draw_rectangle(900, 7, 970, 25, false); //ammo


draw_set_color(c_black);

var rounded_hp = round(oPlayer.hp / 10) * 10;
var hp_sprite = sHP;

draw_sprite_ext(hp_sprite,gui_hp_counter,20,textY+8,0.45,0.45,0,c_white,1);

draw_set_font(fArial18);
draw_text(36, textY-3, rounded_hp);

draw_set_font(fArial12);
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



var progressPercentage = progress / progressMax;

draw_set_color(c_black);
draw_rectangle(300, 7, 480, 25, false);

if(progressPercentage>0)
{
draw_set_color(red);
draw_rectangle(302, 9, 300 + 178 * progressPercentage, 23, false);
}


draw_set_color(darker_gray);
if(room=Upgrades)
{
draw_rectangle(270, 0, 480, 25, false); //round time
}

draw_set_color(c_black);
var jump = "chuj";
if(oPlayer.double_jump_enabled==true){jump=": active";}
else {jump=": inactive"};
draw_sprite_ext(sDouble_Jump_enable,0,530,textY+10,0.4,0.4,0,c_white,1);
draw_text(560, textY, jump);


var dash = "chuj";
if(oPlayer.dash_enabled==true){dash=": active";}
else {dash=": inactive"};

draw_sprite_ext(sDash,0,650,textY+10,0.4,0.4,0,c_white,1);
draw_text(670, textY, + dash);

var ammunation = ammo;
draw_sprite_ext(sHook,0,750,textY+10,0.7,0.7,0,c_white,1);
draw_text(770, textY, string(ammunation));



// Reset the draw color
draw_set_color(c_black);
