/// @description Insert description here
// You can write your code in this editor
var _in = keyboard_check( ord("I") );
var _out = keyboard_check( ord("O") );

if( _in ){
	
	/*
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_color(c_white);
	
	gpu_set_blendmode_ext()
	*/
	
	draw_rectangle_color(0, 0, o_camera.camera_width * 2, o_camera.camera_height * 2, c_black, c_black, c_black, c_black, false);
	
	//gpu_set_blendmode(bm_add);
	//draw_circle_colour(100, 100, 50, c_blue, c_blue, 0);
	//gpu_set_blendmode(bm_normal);
}


if ( _out ){

	
	gpu_set_blendmode(bm_subtract);
	draw_circle_colour(100, 100, 50, c_black, c_black, 0);
	gpu_set_blendmode(bm_normal);
}
