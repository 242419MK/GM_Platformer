/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

red.y = starty;
red.death_timer=10000;
blue.y = starty;
blue.death_timer=10000;
purple.y = starty;
purple.death_timer=10000;
green.y = starty;
green.death_timer=10000;


wait--;
if(wait<=0 && !payed)
{
	payout=true;
}

if(payout)
{
cash1 = oPlayer.red_hearths * 1.12;
cash2 = oPlayer.blue_hearths * 2.13;
cash3 = oPlayer.purple_hearths * 3.18;
cash4 = oPlayer.green_hearths * 4.02;

cash = cash1+cash2+cash3+cash4;

oPlayer.cash = oPlayer.cash + cash ;

oPlayer.red_hearths=0;
oPlayer.blue_hearths=0;
oPlayer.purple_hearths=0;
oPlayer.green_hearths=0;	

wait=240;
payout=false;
payed=true;
}




