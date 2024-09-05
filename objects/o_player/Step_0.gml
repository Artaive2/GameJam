//Declare local variables for controls
var _right = 0;
var _left = 0;
var _up = 0;
var _down = 0;
var _interact = 0;
var _left_mouse_button = 0;

//If the player has control
if(global.player_control = true){
	
	//Controls
	_right = keyboard_check(vk_right) || keyboard_check( ord("D") );
	_left = keyboard_check(vk_left) || keyboard_check( ord("A") );
	_up = keyboard_check(vk_up) || keyboard_check( ord("W") );
	_down = keyboard_check(vk_down) || keyboard_check( ord("S") );

	//Arcade control
	_interact = keyboard_check_pressed( ord("E") );

	//Fishing game control
	_left_mouse_button = mouse_check_button(mb_left)
	
}

//Calculate movement
var _x_movement = _right - _left;
var _y_movement = _down - _up;


//Switch game mechanics
switch(room){
	
	#region Arcade room
	
	//Arcade room
	case RM_Arcade_iso:
	
		//States
		switch(state){

		#region Moving state

			case player_states.moving:
		
				#region Changing direction state based on movement
				
				//Right
				if(x_movement > 0){ 
		
					dir = player_direction.right;
				}
				
				//Left
				if(x_movement < 0){ 
		
					dir = player_direction.left;
				}
		
				//Down
				if(y_movement > 0){ 
		
					dir = player_direction.down;
				}
		
				//Up
				if(y_movement < 0){ 
		
					dir = player_direction.up;
				}
				
				//Down Right
				if(y_movement > 0 && x_movement > 0){
				
					dir = player_direction.down_right;
				}
				
				//Down Left
				if(y_movement > 0 && x_movement < 0){
				
					dir = player_direction.down_left;
				}
				
				//Up Right
				if(y_movement < 0 && x_movement > 0){
				
					dir = player_direction.up_right;
				}
				
				//Up Left
				if(y_movement < 0 && x_movement < 0){
				
					dir = player_direction.up_left;
				}
				
				
				
				#endregion
	
				//Applying sprite changing depending on states
				sprite_index = player_sprite[sprite_state][dir];
		
				//Movement function
				scr_movement(_x_movement, _y_movement);
		
				#region //Collision
		
		
				#region Detecting and interacting with machines
					
					
				//Getting the nearby machine
				nearby_machine = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, o_arcade_machine, true, true);
		
				//If the player is nearby a machine 
				if(nearby_machine != noone){
				
					//If the interacting button is pressed
					if(_interact){
					
						//Get the room saved in the nearest machine
						var _room = nearby_machine.my_room;
							
						//Go to the room
						room_goto(_room);
							
					}
		
				}
					
				#endregion
					
			
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
		
		#region Fishing mechanics
		
		#region Setting the buttons and controls
			
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
		
		#endregion
			
			
		//If the left mouse button is clicked
		if( _left_mouse_button && bobber_just_destroyed = false){
			
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
			
			#region Pulling Bobber
				
			//Local variables to store bobber x and y positions
			var _bobber_x = o_bobber.x;
			var _bobber_y = o_bobber.y;
			
			//If the bobber is being pulled
			if(o_bobber.my_state = bobber_state.pulling){
				
				//Changing pull and escape strength (amount) based on the fish
				switch(o_bobber.fish){
					
					//Small
					case fish_sizes.small:
						
						//The amount to use for multiplication
						pull_amount = .006;
							
						//Clamp the amount so it does not go lower than .002
						pull_amount = clamp(pull_amount, .004, .006);
							
						//The amount to use for multiplication
						escape_amount = .001;
						
					break;
						
					//Medium
					case fish_sizes.medium:
						
						//The amount to use for multiplication
						pull_amount = .005;
							
						//Clamp the amount so it does not go lower than .002
						pull_amount = clamp(pull_amount, .002, .005);
							
						//The amount to use for multiplication
						escape_amount = .002;
							
					break;
						
					//Large
					case fish_sizes.large:
						
						//The amount to use for multiplication
						pull_amount = .004;
							
						//Clamp the amount so it does not go lower than .002
						pull_amount = clamp(pull_amount, .001, .004);
							
						//The amount to use for multiplication
						escape_amount = .003;
							
					break;
						
					
				}
					
					
				//If the button pressed is the same as the dpad
				if(global.dpad_to_press == fishing_dpad){
				
					//Move the bobber towards the player
					o_bobber.x += (x - _bobber_x) * pull_amount;
					o_bobber.y += (y - _bobber_y) * pull_amount;
			
				}else{//If the key pressed does not match the bobber dpad
					
					//Move the bobber further from the player
					o_bobber.x += (_bobber_x - x) * escape_amount;
					o_bobber.y += (_bobber_y - y) * escape_amount;
				
				}
			
			}
			
			#endregion
				
				
			#region Bobber collision and scoring
				
			//If the bobber should return to the player or the bobber is being pulled (fished)
			if(o_bobber.return_bobber = true || o_bobber.my_state = bobber_state.pulling){
			
				//Check for a collison with the bobber
				if( place_meeting(x, y, o_bobber) ){
				
					//Change state to caught
					o_bobber.my_state = bobber_state.caught;
						
					//Switch whether to add to the score or timer based on fish
					switch(o_bobber.fish){
						
						//Timer fish
						case fish_sizes.timer:
							
							o_game.fishing_time_limit += o_bobber.fish;
								
						break;
						
						//All other fish
						default:
							
							//Add to the score the points stored in the bobber's fish variable
							global.fishing_game_score += o_bobber.fish;
							
						break;
						
					}
						
				}
				
			}
				
			#endregion
				
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
	
