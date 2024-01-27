/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
cash1=0;
cash2=0;
cash3=0;
cash4=0;
cash=0;
payout=false;
payed=false;
wait = 240;

starty=y+12;

red = instance_create_layer(x,y+12,"Upgrades",oRedHearth);
red.grv3=0;
blue = instance_create_layer(x+100,y+12,"Upgrades",oBlueHearth);
blue.grv3=0;
purple = instance_create_layer(x+200,y+12,"Upgrades",oPurpleHearth);
purple.grv3=0;
green = instance_create_layer(x+300,y+12,"Upgrades",oGreenHearth);
green.grv3=0;

number1= oPlayer.red_hearths;
number2 = oPlayer.blue_hearths;
number3 = oPlayer.purple_hearths;
number4 = oPlayer.green_hearths;
