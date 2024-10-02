//Controls
var _left_mouse_button = mouse_check_button_pressed(mb_left);
var _quit = keyboard_check(vk_escape);

//Quitting game if escape is pressed
if(_quit == true){

	game_end();
}


//Take player control if a sequence plays
if(seq_state = seq_states.playing){

	global.player_control = false;

}else{ //If a equence is finished playing, return control to the player

	global.player_control = true;

}

//Switch what to do based on the room
switch(room){

	#region In the fishing mini game
	
	case RM_Fishing_MiniGame:
		
		//If the audio is not already playing
		if( !audio_is_playing(a_fishing_music) ){
		
			//Play audio
			//music = audio_play_sound(a_fishing_music, 10, true);
			
		}
		
		#region Game section
		
		//Game sections
		switch(game_section){
			
			#region Start
			
			case "Start":
			
				//Disable control
				global.player_control = false;
				
				//If the player clicks the left mouse button, start game
				if( _left_mouse_button ){
				
					game_section = "During";
					
				}
			
			break;
			
			#endregion
			
			#region During
			
			//During the game
			case "During":
				
				//After the mouse button has been released return control to the player to prevent instant casting after removing the control instruction
				if( mouse_check_button_released(mb_left) ){
					
					//Return control to the player
					global.player_control = true;
					
				}
				
				//If the time decreasing alarm has not been trigged yet
				if(trigger = false){
				
					//Trigger alarm
					alarm[0] = 60;
					
					//Change trigger variable to true
					trigger = true;
				}
				
				//If the time limit ran out
				if(fishing_time_limit <= 0){
			
					//Stop player contol
					global.player_control = false;
					
					//Change game section to end
					game_section = "End";
					
				}
				
			break;
			
			#endregion
			
			#region End
			
			//At the end of the game
			case "End":
				
				//If the score is higher than the high score
				if(global.fishing_game_score > global.fishing_game_highscore){
				
					//Make the score the high score
					global.fishing_game_highscore = global.fishing_game_score;
					
				}
			
			break;
			
			#endregion
			
		}
		
		#endregion
			
	break;
	
	#endregion
	
	
	case RM_Arcade_iso:
		
		//If the audio is not already playing
		if( !audio_is_playing(a_arcade_room) ){
			
			//music = audio_play_sound(a_arcade_room, 10, true);
			
		}
		
	break;
	
	
}



#region TO REMOVE
	

	var _in = keyboard_check( ord("I") );
	var _out = keyboard_check( ord("O") );
	
	if( !instance_exists(o_transition) ){
	
		
		
		if(_in){
	
			var transi = instance_create_layer(0, 0, "layer_ui", o_transition);
		
			transi.in = true;
			transi.circle_size = 300;
	
		}
		
		if(_out){
		
			var transi = instance_create_layer(0, 0, "layer_ui", o_transition);
			
			transi.out = true;
		
		}
	
	}
	

#endregion