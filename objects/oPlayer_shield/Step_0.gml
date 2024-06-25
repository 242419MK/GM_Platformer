/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(instance_exists(oPlayer))
{
x = oPlayer.x
y = oPlayer.y

if(count==true)
{
	visible=true;
	
	counter++;
	var enemy_bullet = instance_place(x, y, oEnemy_Bullet);
	if (enemy_bullet != noone) {
    var distance = point_distance(x, y, enemy_bullet.x, enemy_bullet.y);
    if (distance <= 160) {
        instance_destroy(enemy_bullet);
    }
	}

	var enemy_bullet_big = instance_place(x, y, oEnemy_Bullet_Big);
	if (enemy_bullet_big != noone) {
    var distance = point_distance(x, y, enemy_bullet_big.x, enemy_bullet_big.y);
    if (distance <= 160) {
        instance_destroy(enemy_bullet_big);
    }
	}
	
	if(counter>=time_limit)
	{
		counter=0;
		count=false;
		visible = false;
	}
}
}

