
//Switching based on the state
switch(my_state){
	
	#region Cast state
	
	case bobber_state.cast:
	
		//If the bobber has not reached the target spot
		if(target_reached == false){
			
			//Gradually move the bobber to where the mouse was
			x += (target_x - x) * .2;
			y += (target_y - y) * .2;
			
			//If the bobber has reached the position
			if( position_meeting(target_x, target_y, self) ){
			
				//Change the target_reached variable and state of the bobber
				target_reached = true;
				splash = true;
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
		
		
		#region Fish states
		
		switch(fish_state){
		
			#region No bite
		
			case fish_states.no_bite:
			
				//If the alarm for fish bite has not been set yet, set a random time
				if(alarm_timer == 0){
		
					alarm_timer = irandom_range(150, 200);
					alarm[1] = alarm_timer;
				}
		
				//If there isn't a bite yet
				if(bite == false){
		
					//If the bobber is in the water and the left mouse button has been pressed
					if( target_reached = true && mouse_check_button_pressed(mb_left)){
		
						//Set return bobber to true so the character pulls the bobber back
						return_bobber = true;
				
					}
		
					//SCRIPT FUNCTION DID NOT WORK
					//If the alarm timer has not reached 0 yet
					if(alarm_timer > 0){
	
						//Reduce timer until the alarm for the bite trigger
						alarm_timer--;
			
					}
			
				}
				
			break;
			
			#endregion
			
			
			#region Bite
			
			case fish_states.bite:
			
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
			
					//SCRIPT FUNCTION DID NOT WORK
					//If the escape timer is still higher than 0, subtract 1
					if(escape_timer > 0){
	
						//Reduce timer until the it reaches 0 for the escape
						escape_timer--;
			
					}
			
				}
				
				
				//If the escape timer reaches 0
				if(escape_timer == 0){
		
					//Remove the prompt
					scr_prompt_remove(prompt, ui.prompt);
			
					//Reset the bite to false
					bite = false;
			
					//Reset the escape alarm to a random value
					escape_timer = irandom_range(100, 190);
			
					//Reset the bite alarm to 0
					alarm_timer = 0;
					
					//Set fish state
					fish_state = fish_states.no_bite;
			
				}
				
				
			break;
			
			#endregion
			
			
			#region Failed catch
			
			case fish_states.failed_catch:
			
				if(alarm_timer > 0){
				
					alarm_timer--;
				}
				
				if(alarm_timer = 0){
				
					return_bobber = true;
				}
			
			break;
			
		
		}
		
		#endregion
		
		
		#endregion
		
		
	break;

	#endregion
	
	
	#region Being pulled
	
	case bobber_state.pulling:
		
		//If the alarm reaches 0, trigger alarm
		if(alarm_timer == 0){
		
			alarm[1] = 1;
		
		}
	
		//SCRIPT FUNCTION DID NOT WORK
		//If the alarm is not 0 yet, subtract 1
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
		
		//If the bobber gets too far from the player, the state changes to caught and player gets no points
		if( x < 5 || y < 5 || x > (room_width - 5) || y > (room_width - 5) ){
		
			fish_state = fish_states.failed_catch;
			my_state = bobber_state.fishing;
			alarm_timer = 25;
			
		}
		
	
	break;
	
	#endregion
	
	
	#region Caught
	
	case bobber_state.caught:
	
		//Go to player
		with(o_player){
		
			//Change the variable bobber_just_destroyed to 
			bobber_just_destroyed = true;
			
			//Destroy the bobber
			instance_destroy(o_bobber);
		
		}
	
	
	break;
	
	
	#endregion
	
}
		
//If the bobber is supposed to return to the player
if(return_bobber = true){

	//Return the bobber to the player
	x += (o_player.x - x) * .05;
	y += (o_player.y - y) * .05;
	
}


//TO REMOVE
if(keyboard_check_pressed(ord("T"))){
	
		fish = fish_sizes.large;
}
if(keyboard_check_pressed(ord("Q"))){
	
		fish = fish_sizes.medium;
}
if(keyboard_check_pressed(ord("U"))){
	
		fish = fish_sizes.small;
}