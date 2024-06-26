/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(boss_hp<=0.75*boss_hp_max and boss_hp>=0.5*boss_hp_max and final_phase==false )
{
	boss_stage=1;
}
else  if(boss_hp<=0.50*boss_hp_max and boss_hp>=0.25*boss_hp_max and final_phase==false)
{
	boss_stage=2;
}
else  if(boss_hp<=0.25*boss_hp_max and boss_hp>=0.0)
{
	boss_stage=3;
}

if(final_phase==true)
{
	boss_stage=3;
}


if(boss_stage==0 and final_phase==false)
{
	stage_0_counter++;
	if(stage_0_counter==stage_0_spawntime and spawn_red_end==false)
	{
		 var red = instance_create_layer(1100+adjust, 200, "Enemies", oEnemy_A_boss);
		 adjust+=64;
		 stage_0_counter=0;
	}
	
	if(adjust>=900)
	{
		spawn_red_end=true;
	}
}



else if(boss_stage==1 and final_phase==false)
{
	respawn_timer++;
	if( spawn_blue_end==false)
	{
	 var blue = instance_create_layer(990, 250, "Enemies", oEnemy_S_boss);
	 var purple = instance_create_layer(990, 380, "Enemies", oEnemy_S_2_boss);
	
	 var blue2 = instance_create_layer(990, 510, "Enemies", oEnemy_S_boss);
	 var purple2 = instance_create_layer(990, 640, "Enemies", oEnemy_S_2_boss);
	 
	 
	 var blue3 = instance_create_layer(2070, 250, "Enemies", oEnemy_S_boss);
	 var purple3 = instance_create_layer(2070, 380, "Enemies", oEnemy_S_2_boss);
	 
	 var blue4 = instance_create_layer(2070, 510, "Enemies", oEnemy_S_boss);
	 var purple4 = instance_create_layer(2070, 640, "Enemies", oEnemy_S_2_boss);
	}
	
	if(respawn_timer==respawn_delay)
	{
	 var blue = instance_create_layer(995, 250, "Enemies", oEnemy_S_boss);
	 var purple = instance_create_layer(995, 380, "Enemies", oEnemy_S_2_boss);
	
	 var blue2 = instance_create_layer(995, 510, "Enemies", oEnemy_S_boss);
	 var purple2 = instance_create_layer(995, 640, "Enemies", oEnemy_S_2_boss);
	 
	 
	 var blue3 = instance_create_layer(2065, 250, "Enemies", oEnemy_S_boss);
	 var purple3 = instance_create_layer(2065, 380, "Enemies", oEnemy_S_2_boss);
	 
	 var blue4 = instance_create_layer(2065, 510, "Enemies", oEnemy_S_boss);
	 var purple4 = instance_create_layer(2065, 640, "Enemies", oEnemy_S_2_boss);
	}
	spawn_blue_end=true;
	

}
else if(boss_stage==2 and final_phase==false)
{
	spawn_blue_end=true;
	if( spawn_green_end==false)
	{
	 var spawner1= instance_create_layer(1290, 190, "Enemies", oSpawner_enemy_L_boss);
	 var spawner2 = instance_create_layer(1770, 190, "Enemies", oSpawner_enemy_L_boss);
	 spawn_green_end=true;
	}
	
}

else if(boss_stage==3)
{
	heal=true;
	final_phase=true;
	if(spawn_final_end==false)
	{
	 var spawner3= instance_create_layer(1290, 190, "Enemies", oSpawner_enemy_L_boss);
	 var spawner4 = instance_create_layer(1770, 190, "Enemies", oSpawner_enemy_L_boss);
	 var spawner7 = instance_create_layer(1530, 190, "Enemies", oSpawner_enemy_L_boss);
	 var spawner5= instance_create_layer(1450, 220, "Enemies", oSpawner_enemy_S_boss);
	 var spawner6 = instance_create_layer(1620, 220, "Enemies", oSpawner_enemy_S_boss);
	 spawn_final_end=true;
	}

	
}

if(boss_hp<=0)
{
	oBOSS_dead.end_now=true;
	visible=false;
}


if(boss_hp<=0.4 * boss_hp_max and heal==true)
{
	boss_hp+=bonus;
	if(boss_hp>0.39 * boss_hp_max)
	{
		heal=false;
		bonus=0;
	}
}



