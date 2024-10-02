
if( surface_exists(surf) ){

	surf = surface_create(o_camera.camera_width, o_camera.camera_height, surface_rgba8unorm);

}

/*
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);
	
gpu_set_blendmode_ext()
*/

surface_set_target(surf);

//draw_rectangle_color(camera_x, camera_y, camera_x + camera_get_view_width(view_camera[0]), camera_y + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
draw_rectangle_color(x, y, x + camera_get_view_width(view_camera[0]), y + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);

gpu_set_blendmode(bm_subtract);

draw_set_circle_precision(64);

//draw_circle(camera_x + (camera_get_view_width(view_camera[0]) / 2), camera_y + (camera_get_view_height(view_camera[0]) / 2), circle_size, 0);
draw_circle(x + (camera_get_view_width(view_camera[0]) / 2), y + (camera_get_view_height(view_camera[0]) / 2), circle_size, 0);

gpu_set_blendmode(bm_normal);

surface_reset_target();
	
	
	
//gpu_set_blendmode(bm_add);
//draw_circle_colour(100, 100, 50, c_blue, c_blue, 0);
//gpu_set_blendmode(bm_normal);

draw_surface(surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));