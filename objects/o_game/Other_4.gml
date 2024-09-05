//Stop all audio
audio_stop_all();

//What to do at the start of the room based on which room it is
switch(room){

	#region Fishing game
	
	case RM_Fishing_MiniGame:
	
		//Reset variables
		trigger = false;
		game_section = "Start";
		fishing_time_limit = 120;
	
	break;
	
	#endregion

}