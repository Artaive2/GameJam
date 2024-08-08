
//Switching based on the state
switch(my_state){
	
	#region Thrown state
	
	case bobber_state.thrown:
	
		//Gradually move the bobber to where the mouse was
		if(target_reached == false){

			x += (target_x - x) * .8;
			y += (target_y - y) * .8;
			
			//If the bobber has reached the position
			if(x == target_x && y == target_y){
			
				//Change the variable and state
				target_reached = true;
				my_state = bobber_state.fishing;
				
				//Start bobbing
				alarm[0] = 1;
			}
	
		}
		
		
	break;
	
	#endregion
	
	#region Fishing
	
	case bobber_state.fishing:
		
		//Applying bobbing
		y += bobbing;
		
		#region Bite detection
		
		//If the alarm for fish bite has not been set yet, set a random time
		if(alarm_timer == 0){
		
			alarm_timer = irandom_range(150, 200);
			alarm[1] = alarm_timer;
		}
		
		//If there isn't a bite yet and the timer has been set
		if(bite == false){
		
			scr_timer_reduce(alarm_timer);
			
		}
		
		//If a bite has been triggered, pop a prompt, and start timer for when fish escapes
		if(bite == true && prompt == noone){
		
			prompt = scr_prompt_pop(self, x, y - 20);
			
		}
		
		//If there's a bite
		if(bite == true){
			
			//If the mouse button has been pressed
			if( mouse_check_button(mb_left) ){
				
				//Remove prompt
				scr_prompt_remove(prompt, ui.prompt);
				
				//Change state to pulling fish
				my_state = bobber_state.pulling;
			
			}
			
			//If the escape timer is still higher than 0, subtract 1
			scr_timer_reduce(escape_timer);
			
		}
			
		//If the escape timer is 0, remove the prompt
		if(escape_timer == 0){
		
			scr_prompt_remove(prompt, ui.prompt);
			bite = false;
			escape_timer = irandom_range(100, 190);
			alarm_timer = 0;
			
		}
		
		#endregion
		
		
		
	break;

	#endregion
	
	#region Being pulled
	
	case bobber_state.pulling:
	
		//If the alarm reaches 0, trigger alarm
		if(alarm_timer == 0){
		
			alarm[1] = 1;
		
		}
	
		//If the alarm is not 0 yet, subtract 1
		//scr_timer_reduce(alarm_timer); //The function here doesn't work for some reason, maybe I need to add a condition
		if(alarm_timer > 0){
	
			alarm_timer--;
		}
	
		//Assign the random direction of the dpad to pass to the player
		switch(dpad_sprite_num){
		
			//Right
			case 0:
				
				global.dpad_to_press = "Left";
				
			break;
			
			//Left
			case 1:
			
				global.dpad_to_press = "Right";
				
			break;
			
			//Up
			case 2:
			
				global.dpad_to_press = "Up";
				
			break;
			
			//Down
			case 3:
			
				global.dpad_to_press = "Down";
				
			break;
			
		}
	
	break;
	
	#endregion
	
	#region Caught
	
	case bobber_state.caught:
	
	
	break;
	
	#endregion
	
}