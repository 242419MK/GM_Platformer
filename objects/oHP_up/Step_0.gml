/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
transactionCompleted = false;

if(place_meeting(x,y, oBullet) && !transactionCompleted)
{
	if(oPlayer.cash >= 20)
	{
		oPlayer.cash -= 20;
		oPlayer.maxhp+=20;
		
		transactionCompleted = true;
	}
}


