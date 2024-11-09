var _camera = view_camera[0];

switch(room){

	//In the fishing minigame room
	case RM_Fishing_MiniGame:
	
		//Calculating display size
		//var _display_width = room_width * scale;
		//var _display_height = room_height * scale;
		
		//Apply camera size
		camera_set_view_size(_camera, room_width, room_height);
	
		//Setting window size
		//window_set_size(_display_width, _display_height);
	
		//Fixing app surface to match display
		surface_resize(application_surface, display_width, display_height);
		
		
		//To center window after 1 second
		alarm[0] = 1;

	break;

	//In the arcade room
	case RM_Arcade_iso:
	
		
		
		//Apply camera size
		camera_set_view_size(_camera, room_width, room_height);

		//Setting window size
		window_set_size(display_width, display_height);

		//Fixing app surface to match display
		surface_resize(application_surface, display_width, display_height);
		
		//To center window after 1 second
		alarm[0] = 1;
		
		//Have the camera follow the player
		camera_set_view_pos(_camera, target.x, target.y);
		
	break;

}