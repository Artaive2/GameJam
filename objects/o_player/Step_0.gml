event_inherited();
//Controls
var _right = keyboard_check(vk_right) || keyboard_check( ord("D") );
var _left = keyboard_check(vk_left) || keyboard_check( ord("A") );
var _up = keyboard_check(vk_up) || keyboard_check( ord("W") );
var _down = keyboard_check(vk_down) || keyboard_check( ord("S") );
var _interact = keyboard_check_pressed( ord("E") );

//Calculate movement
var _x_movement = _right - _left;
var _y_movement = _down - _up;

//Switch game mechanics
switch(room){
	
	#region Arcade room
	
	//Arcade room
	case RM_Arcade_iso:
	
		//Set mask for collision
		mask_index = s_player_idle_down;
		
		//States
		switch(state){

		#region Moving state

			case player_states.moving:
		
				#region Changing direction state based on movement
				if(x_movement > 0){ //Right
		
					dir = player_direction.right;
				}
		
				if(y_movement > 0){ //Down
		
					dir = player_direction.down;
				}
		
				if(y_movement < 0){ //Up
		
					dir = player_direction.up;
				}
				
				#endregion
	
				//Applying sprite changing depending on states
				sprite_index = player_sprite[sprite_state][dir];
		
				//Movement function
				scr_movement(_x_movement, _y_movement);
		
				#region //Collision
		
				#region Detecting and interacting with machines
					
					
				//Getting the nearby machine
				var _nearby_machine = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, o_arcade_machines_par, true, true);
		
				//If the player is nearby a machine and the interact key is pressed
				if(_nearby_machine != noone){
				
					//If there isn't a prompt already
					if(prompt == noone){
					
						//Pop a prompt
						prompt = scr_prompt_pop(_nearby_machine, _nearby_machine.x, _nearby_machine.y - _nearby_machine.sprite_height);
					
					}
				
					//If the interacting button is pressed
					if(_interact){
					
						//Get the room saved in the nearest machine
						var _room = _nearby_machine.my_room;
							
						//Go to the room
						room_goto(_room);
							
					}
		
				}
					
				#endregion
					
				//If not nearby a machine, remove the prompt
				if(!_nearby_machine /* && !_nearby_npc */){
			
					scr_prompt_remove(prompt, ui.prompt);
				}
			
				#endregion
		
			break;
	
		#endregion

		#region Interacting state

			case player_states.interacting:
		
				//Remove the prompt
				scr_prompt_remove(o_prompt, prompt);
		
			break;
	
		#endregion

		}
		
	break;
	
	#endregion
	
	#region Fishing minigame
	
	case RM_Fishing_MiniGame:
	
		//Set depth of the player
		depth = -1000;
		
		//Set the mask used for collision
		mask_index = s_fishing_player;
		
		//Center the character
		x = room_width / 2;
		y = room_height / 2;
		
		//Change sprite
		sprite_index = s_fishing_player;
		
		#region Fishing mechanics
		
		//A variable to use for checking if any key is being pressed
		var _keys = _right + _left +_up + _down;
		
		//If a key is pressed, assign it to a variable to check if it matches the dpad
		if(_right == 1){
		
			fishing_dpad = "Right";
		}
		
		if(_left == 1){
		
			fishing_dpad = "Left";
		}
		
		if(_up == 1){
		
			fishing_dpad = "Up";
		}
		
		if(_down == 1){
		
			fishing_dpad = "Down";
		}
		
		//If no key is being pressed, return fishing_dpad to nothing
		if( _keys == 0){
		
			fishing_dpad = "none";
			
		}
		
		//If the left mouse button is clicked
		if( mouse_check_button(mb_left) && bobber_just_destroyed = false){
			
			//Get the x and y of the mouse
			var _mouse_x = mouse_x;
			var _mouse_y = mouse_y;
			
			//If the bobber object does not exist
			if( !instance_exists(o_bobber) ){
			
				//Create an instance of the bobber object
				var _bobber = instance_create_depth(x, y, -10000, o_bobber);
				
			}
			
		}
		
		//If the bobber exists
		if( instance_exists(o_bobber) ){
			
			//Local variables to store bobber x and y positions
			var _bobber_x = o_bobber.x;
			var _bobber_y = o_bobber.y;
			
			//If the bobber is being pulled
			if(o_bobber.my_state = bobber_state.pulling){
				
				//If the button pressed is the same as the dpad
				if(global.dpad_to_press == fishing_dpad){
				
					//The amount to use for multiplication
					var pull_amount = .005;
					
					//Clamp the amount so it does not go lower than .002
					pull_amount = clamp(pull_amount, .002, .005)
					
					//Move the bobber towards the player
					o_bobber.x += (x - _bobber_x) * pull_amount;
					o_bobber.y += (y - _bobber_y) * pull_amount;
			
				}else{//If the key pressed does not match the bobber dpad
					
					//The amount to use for multiplication
					var _escape_amount = .002;
					
					//Move the bobber further from the player
					o_bobber.x += (_bobber_x - x) * _escape_amount;
					o_bobber.y += (_bobber_y - y) * _escape_amount;
				
				}
			
			}
			
			
			//If the bobber should return to the player or the bobber is being pulled (fished)
			if(o_bobber.return_bobber = true || o_bobber.my_state = bobber_state.pulling){
			
				//Check for a collison with the bobber
				if( place_meeting(x, y, o_bobber) ){
				
					//Change state to caught
					o_bobber.my_state = bobber_state.caught;
					
				}
				
			}
				
		}
		
		#endregion
		
		//If the bobber has just been destroyed, wait a few seconds before being able to cast again
		if(bobber_just_destroyed = true){
		
			//If the timer has not reached 0 yet
			if(alarm_timer > 0){
			
				//Subtract 1
				alarm_timer--;
			}
			
			//If the timer reached 0
			if(alarm_timer = 0){
				
				//Trigger alarm
				alarm[0] = 2;
				
				//Reset timer
				alarm_timer = 10;
			
			}
			
		}
		
		
	break;
	
	#endregion
}