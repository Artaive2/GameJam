//Switching sprite and positions based on which room
switch(room){

	#region Arcade room
	case RM_Arcade_iso:
	
		//Set mask for collision
		mask_index = s_player_idle_down;
		
	break;
	
	#endregion
	
	#region Fishing game room
	
	case RM_Fishing_MiniGame:
	
		//Set depth of the player
		depth = -1000;
		
		//Change sprite
		sprite_index = s_fishing_player;
		
		//Set the mask used for collision
		mask_index = s_fishing_player;
		
		//Center the character
		x = room_width / 2;
		y = room_height / 2;
		
		
		
	break;
	
	#endregion
	
}