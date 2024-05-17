/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

enemy =  instance_create_layer(x, y, "Enemies", oEnemy_A);
wait_counter=120;

enemy.fullHp=100;
enemy.hp=enemy.fullHp;
enemy.value=0;
open=false;
enemies_killed = 0;
enemies_killed_max = 10;
