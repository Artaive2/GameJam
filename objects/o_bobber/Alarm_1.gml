//Switch what to do based on if a fish has bitten or not
switch(bite){
	
	
	//No bite
	case false:
	
		//Check if the return bobber is false so a bite doesn't trigger while the player is returning the bobber
		if( return_bobber = false){
			
			#region Choose a fish
			
			var _fish = irandom_range(1, 16);
			
			//If the random number is from 1 to 10, pick small fish
			if(_fish >= 1 && _fish <= 10){
			
				fish = fish_sizes.small;
				
			}
			
			//If the random number is from 11 to 15, pick medium fish
			if(_fish >= 11 && _fish <= 15){
			
				fish = fish_sizes.medium;
				
			}
			
			//If the random number is 16, pick large fish
			if(_fish = 16){
			
				fish = fish_sizes.large;
				
			}
			
			
			#endregion
			
			//Let fish bite
			bite = true;
			fish_state = fish_states.bite;
			
		}
		
	break;
	
	
	//Bite
	case true:
	
		//Choose a random direction for the dpad
		dpad_sprite_num = irandom(3);
		
		//Reset the alarm timer with a random number
		alarm_timer = irandom_range(50, 120);
	
	break;
	
}