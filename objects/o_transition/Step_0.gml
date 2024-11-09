//Get the x and y of the camera
camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);


//If the transition surface does not exist
if( !surface_exists(surf) ){

	//Create a surface
	surf = surface_create(width, height, surface_rgba8unorm);

}

//If the transition should go in
if(in = true){
	
	//If the circle size is bigger than 0
	if(circle_size >= 0){
		
		//Reduce circle size
		circle_size -= 30;
		
	}
	
	//If the circle size is less than or is 0
	if(circle_size <= 0){
		
		//Go the the target room if there is one
		if(target_room > -1 && target_room != undefined){
			
			room_goto(target_room);
			
		}
		
		//Turn the in transition to false
		in = false;
		
		//Turn the out transition to true
		out = true;
		
	}

	
}

//If the out transition is true
if(out = true){

	//If the circle size is less than the maximum size (the size of the view)
	if(circle_size < max_size){
	
		//Increase the circle size
		circle_size += 30;
	
	}
	
	//If the circle size is bigger than or equal the maximum size (covers the view)
	if(circle_size >= max_size){
	
		//Free the surface
		surface_free(surf);
		
		//Destroy transition instance
		instance_destroy();
	
	}
	
}