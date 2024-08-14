draw_self();

//draw_text(5, 5, string( bite ) );
//draw_text(5, 20, string( fish_state ) );

switch(my_state){

	
	//If the fish is being pulled
	case bobber_state.pulling:
	
		//Variable to store dpad sprite and switch it when alarm 1 is triggered
		var _drawn_dpad = draw_sprite(dpad_sprite[dpad_sprite_num], image_index, x - 1, y + 2);
		
	break;
	
	
	
	//If the player is fishing
	case bobber_state.fishing:
	
		//If the fish bites
		if(fish_state = fish_states.bite){
		
			//Fix image speed
			image_speed = 2.5;
				
			//Draw the waves
			prompt = draw_sprite(s_waves, image_index, x, y);
			
			
		}
	
	break;

}
