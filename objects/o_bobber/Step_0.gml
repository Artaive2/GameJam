
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
	
	#region No fish 
	
	case bobber_state.fishing:
		
		//Applying bobbing
		y += bobbing;
		
		#region Bite detection
		
		//If the alarm for fish bite has not been set yet, set a random time
		if(alarm_timer == 0){
		
			alarm_timer = irandom_range(10, 50);
			alarm[1] = alarm_timer;
		}
		
		//If there isn't a bite yet and the timer has been set
		if(bite == false && alarm_timer > 0){
		
			//Reduce timer until the alarm for the bite triggers
			alarm_timer--;
			
		}
		
		//If a bite has been triggered, pop a prompt, and start timer for when fish escapes
		if(bite == true && prompt == noone){
		
			prompt = scr_prompt_pop(self, x, y - 20);
			
		}
		
		//If there's a bite and the escape timer is still higher than 0
		if(bite == true && escape_timer > 0){
			
			//Reduce the timer
			escape_timer--;
				
		}
			
		//If the escape timer is 0, remove the prompt
		if(escape_timer == 0){
		
			scr_prompt_remove(prompt, ui.prompt);
			
		}
		
		#endregion
		
		
	break;

	#endregion
	
	#region Being pulled
	
	case bobber_state.pulling:
	
	break;
	
	#endregion
	
	#region Caught
	
	case bobber_state.caught:
	
	
	break;
	
	#endregion
	
}