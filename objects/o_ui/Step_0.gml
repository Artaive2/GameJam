
switch(fade_me){

	//Fade in
	case 0:
	
		//If the alpha is under 1 (not fully visible)
		if(image_alpha < 1){
		
			//Add to the alpha
			image_alpha += fade_speed;
			
		}
		
		//If the alpha is 1 (fully viaible)
		if(image_alpha >= 1){
		
			//Change fading state to keep prompt visible
			fade_me = 1;
		}
		
	break;
	
	//Fade out
	case 2:
	
		//If the alpha is above 0 (fully visible)
		if(image_alpha > 0){
		
			//Keep subtracting from the alpha
			image_alpha -= fade_speed;
		}
		
		//If the alpha is 0 or less
		if(image_alpha <= 0){
			
			//After a frame, destroy the object
			alarm[0] = 1;
			
		}
		
	break;
}