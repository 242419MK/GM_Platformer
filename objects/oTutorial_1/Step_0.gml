/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(!instance_exists(oEnemy_A))
{
	enemy_killed++;
	wait_counter--;
	if(wait_counter<=0)
	{
		enemy =  instance_create_layer(x, y, "Enemies", oEnemy_A);
		enemy.hp=1000000;
		enemy.value=0;
		wait_counter=120;
	}
	
	
}

if(enemy_killed>0)
{
	open = true;
}

if(open)
{
	oGate1.y = oGate1.y-0.7;
}

if(oGate1.y<300)
{
	open=false;
}



if(instance_exists(oEnemy_A))
{
	if(oEnemy_A.grabbed)
	{
		oEnemy_A.hp=1;
	}
}

if(oPlayer.hp<=10){
	oPlayer.hp=10;
}



