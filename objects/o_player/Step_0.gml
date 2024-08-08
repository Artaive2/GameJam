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
	
		depth = -1000;
		
		//Center the character
		x = room_width / 2;
		y = room_height / 2;
		
		//Change sprite
		sprite_index = s_fishing_player;
		
		#region Fishing mechanics
		
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
		
		//If the left mouse button is clicked
		if( mouse_check_button(mb_left) ){
			
			//Get the x and y of the mouse
			var _mouse_x = mouse_x;
			var _mouse_y = mouse_y;
			
			//If the bobber object does not exist
			if( !instance_exists(o_bobber) ){
			
				//Create an instance of the bobber object
				var _bobber = instance_create_depth(x, y, -10000, o_bobber);
				
			}
			
		}
		
		//If the button pressed is the same as the dpad
		if(global.dpad_to_press = fishing_dpad){
			
			o_bobber.x += (x - o_bobber.x) * .005;
			o_bobber.y += (y - o_bobber.y) * .005;
			
		
		}
		
		
		#endregion
		
	break;
	
	#endregion
}