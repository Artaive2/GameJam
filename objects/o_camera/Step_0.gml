//Variables
var _camera_width = room_width - camera_width;
var _camera_height = room_height - camera_height;

//If the player exists, set the x and y of the player to be in the middle of the camera
if( instance_exists(o_player) ){

	camera_x = target.x - (camera_width / 2);
	camera_y = target.y - (camera_height / 2);
	
	//Clamp camera to not go outside of room
	//camera_x = clamp(camera_x, 0, _camera_width);
	//camera_y = clamp(camera_y, 0, _camera_height);
}

//Set the position of the room
camera_set_view_pos(view_camera[0], camera_x, camera_y);