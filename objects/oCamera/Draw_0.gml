draw_set_color(c_gray);
draw_rectangle(x-410, y+200, x+100, y+230,false)

draw_set_color(c_white);

var uni = unit;

draw_text(x-400, y+200, string(uni));

var s1 = b1speed;

draw_text(x-350, y+200, "V layer_1: " + string(s1));

var s2 = b2speed;

draw_text(x-200, y+200, "V layer_2: " + string(s2));

var s3 = b3speed;

draw_text(x-50, y+200, "V layer_3: " + string(s3));



