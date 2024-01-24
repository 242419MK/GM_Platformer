/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
cash1=0;
cash2=0;
cash3=0;
cash4=0;
cash=0;

if(instance_exists(oPlayer))
{
cash1 = oPlayer.red_hearths * 1.12;
cash2 = oPlayer.blue_hearths * 2.13;
cash3 = oPlayer.purple_hearths * 3.18;
cash4 = oPlayer.green_hearths * 4.02;

cash = cash+cash2+cash3+cash3;

oPlayer.cash = cash;

oPlayer.red_hearths=0;
oPlayer.blue_hearths=0;
oPlayer.purple_hearths=0;
oPlayer.green_hearths=0;	
}

