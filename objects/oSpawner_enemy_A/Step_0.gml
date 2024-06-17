/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
x = startx;
y = starty;
counter++;
if(counter>=300 && spawned_enemies<max_enemies_spawned)
{
	var enemy = instance_create_layer(x, y, "Enemies", oEnemy_A);
	counter=0;
	spawned_enemies++;
}

if(grabbed==true)
{
	sprite_index=sSpawner_hitted;
	image_xscale=1.25;
	image_yscale=1.25;
}

if(grabbed==false)
{
	sprite_index=sSpawnerRed;
		image_xscale=1;
	image_yscale=1;
}

if(dead==true)
{
	oPlayer_info.enemies_killed=oPlayer_info.enemies_killed+1;
	audio_play_sound(m_enemy_hitted,2000,false);	
	audio_play_sound(m_enemy_hitted,2001,false);	
	audio_play_sound(m_enemy_hitted,2002,false);	
	var reward1 = instance_create_layer(x-20, y-10, "Player", oRedHearth);
	var reward2 = instance_create_layer(x, y-20, "Player", oRedHearth);
	var reward3 = instance_create_layer(x+20, y-10, "Player", oRedHearth);
	instance_destroy()
}

if(spawned_enemies==max_enemies_spawned)
{
	instance_destroy()
}

