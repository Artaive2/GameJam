//Controls
var _quit = keyboard_check(vk_escape);

//Quitting game if escape is pressed
if(_quit == true){

	game_end();
}


//Switch what to do based on the room
switch(room){

	//In the fishing mini game
	case RM_Fishing_MiniGame:
		
		//Game sections
		switch(game_section){
			
			//During the game
			case "During":
				
				//If the time decreasing alarm has not been trigged yet
				if(trigger = false){
				
					//Trigger alarm
					alarm[0] = 60;
					
					//Change trigger variable to true
					trigger = true;
				}
				
				
			break;
			
		}
			
	break;
}



#region TO REMOVE
	
	
	
	
	if(keyboard_check_pressed(ord("C"))){
	
		global.fishing_game_score += 100;
	}
	
	//To go to the minigame room quickly
	var _go_to_game = keyboard_check( ord("F") );
	
	if(_go_to_game){
	
		room_goto(RM_Fishing_MiniGame);
	}

#endregion