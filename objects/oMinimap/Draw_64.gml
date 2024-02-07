/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(!surface_exists(surfMinimapBg)) RefreshMapBG();
draw_surface(surfMinimapBg,x,y);

if(!surface_exists(surfMinimapEntities)) surfMinimapEntities = surface_create(w,h);
surface_set_target(surfMinimapEntities);
	draw_clear_alpha(c_black,0.0);
	with(oEnemy_A)
	{
		if(entityOnMinimap == true) draw_sprite_ext(sEnemy_A_minimap,0,x/32,y/32,1.0,1.0,0.0,c_red,1.0);
	}
	with(oEnemy_S)
	{
		if(entityOnMinimap == true) draw_sprite_ext(sEnemy_S2_minimap,0,x/32,y/32,2.0,2.0,0.0,c_blue,1.0);
	}
	with(oEnemy_S_2)
	{
		if(entityOnMinimap == true) draw_sprite_ext(sEnemy_S2_minimap,0,x/32,y/32,2.0,2.0,0.0,c_purple,1.0);
	}
	with(oEnemy_L)
	{
		if(entityOnMinimap == true) draw_sprite_ext(sEnemy_L_minimap,0,x/32,y/32,2.0,2.0,0.0,c_green,1.0);
	}
	with(oPlatformUpMax)
	{
		if(entityOnMinimap == true) draw_sprite_ext(sPlatform_minimap,0,x/32,y/32,2.0,2.0,0.0,c_white,1.0);
	}
	with(oPlayer)
	{
		if(entityOnMinimap == true) draw_sprite_ext(sPlayer,0,x/32,y/32,0.25,0.25,0.0,c_white,1.0);
	}
	
surface_reset_target()
draw_surface(surfMinimapEntities,x,y);
	
var _vX = camera_get_view_x(view_camera[0] / TILE_SIZE);
var _vY = camera_get_view_y(view_camera[0] / TILE_SIZE);
draw_sprite_stretched(sMinimapView,0,x + _vX,y + _vY,1440/TILE_SIZE,360/TILE_SIZE);



