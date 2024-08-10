//Switch what to do based on if a fish has bitten or not
switch(bite){
	
	//No bite
	case false:
	
		//Let fish bite
		bite = true;
		fish_state = fish_states.bite;
		
	break;
	
	//If bite
	case true:
	
		//Choose a random direction for the dpad
		dpad_sprite_num = irandom(3);
		
		//Reset the alarm timer with a random number
		alarm_timer = irandom_range(50, 120);
	
	break;
	
}