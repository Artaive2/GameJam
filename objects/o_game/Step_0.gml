//Controls
var _quit = keyboard_check(vk_escape);

//Quitting game if escape is pressed
if(_quit == true){

	game_end();
}

//Switch what to create based on the room
switch(room){


	case RM_Fishing_MiniGame:
	
		
			
	break;
}

#region TO REMOVE
	
	//To go to the minigame room quickly
	var _go_to_game = keyboard_check( ord("F") );
	
	if(_go_to_game){
	
		room_goto(RM_Fishing_MiniGame);
	}

#endregion