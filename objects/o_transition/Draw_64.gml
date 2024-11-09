transition_circle();

/*

//If the transition surface does not exist
if( !surface_exists(surf) ){

	//Create a surface
	surf = surface_create(width, height, surface_rgba8unorm);

}

//Set the target of what is about to be drawn to be the created surface
surface_set_target(surf);

//Draw a black rectangle that covers the view
draw_rectangle_color(0, 0, surface_get_width(surf), surface_get_height(surf), c_black, c_black, c_black, c_black, false);

//Set blend mode to subtract
gpu_set_blendmode(bm_subtract);

//Make the circle smooth
draw_set_circle_precision(64);

//Draw a circle to create a transparent circle in the black rectangle
draw_circle(0 + (surface_get_width(surf) / 2), 0 + (surface_get_height(surf) / 2), circle_size, 0);

//Return blendmode to normal
gpu_set_blendmode(bm_normal);

//Reset the drawing target
surface_reset_target();

//Draw the surface to the screen

//draw_surface(surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
draw_surface(surf, 0, 0);