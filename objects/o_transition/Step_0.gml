camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);

if(in = true){
	
	if(circle_size >= 0){
		
		circle_size -= 12;
		
	}
	
	
	if(circle_size <= 0){
	
		in = false;
		
		out = true;
		
	}

	
}

if(out = true){

	if(circle_size < max_size){
	
		circle_size += 12;
	
	}
	
	if(circle_size >= max_size){
	
		surface_free(surf);
		instance_destroy();
	
	}
	
}