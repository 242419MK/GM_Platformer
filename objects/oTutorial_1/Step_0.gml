/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(!instance_exists(oEnemy_A) && enemies_killed < enemies_killed_max)
{
	wait_counter--;
	if(wait_counter<=0)
	{
		enemy =  instance_create_layer(x, y, "Enemies", oEnemy_A);
		enemy.value=0;
		enemy.damage = 12;
		wait_counter=120;
	}
}

if(oPlayer.red_hearths>enemies_killed)
{
	enemies_killed++;
}

if(instance_exists(oEnemy_A))
{
	with(oEnemy_A)
	{
	if(x > 0 && x<room_width && y>0 && y<room_height)
	{}else instance_destroy();
	}
}


if(oPlayer.red_hearths>3)
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



