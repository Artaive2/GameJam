//Moving function
function scr_movement(_x_movement, _y_movement){
	
	//Temporary variable for speed
	var _speed = 1;
	
	
	#region Change based on different movement
		
	//If not moving, change to idle
	if(x_movement == 0 && y_movement == 0){
		
		sprite_state = sprite_states.idle;
	}
		
	//If moving x OR y, change to walking and have normal speed
	if(x_movement != 0 || y_movement != 0){
		
		sprite_state = sprite_states.walking;
		
		_speed = 1;
		
	}
	
	//If moving x AND y, fix diagonal movement
	if(x_movement != 0 && y_movement != 0){
	
		_speed = diagonal_spd;
		
	}
	
	#endregion
	
	
	#region Acceleration
	
	
	//Increasing
	if(_x_movement != 0){
	
		//Keeps adding .5
		x_movement += _x_movement * .5;
		x_movement = clamp(x_movement, -spd, spd);
		
	}else{//Decreasing
	
		//If absolute (the positive) of current movement - acceleration (.5) is still higher than 0
		if(abs(x_movement) - acceleration > 0){
			
			//Increase or decrease based on direction
			x_movement -= acceleration * sign(x_movement);
			
		}else{//If not (x_movement)
		
			x_movement = 0;
		}
	}
	
	//Increasing
	if(_y_movement != 0){
	
		//Keeps adding .5
		y_movement += _y_movement * .5;
		y_movement = clamp(y_movement, -spd, spd);
		
	}else{//Decreasing
	
		//If absolute (the positive) of current movement - acceleration (.5) is still higher than 0
		if(abs(y_movement) - acceleration > 0){
			
			//Increase or decrease based on direction
			y_movement -= acceleration * sign(y_movement);
			
		}else{//If not (x_movement)
		
			y_movement = 0;
		}
	}
	
	#endregion
	
	//Apply movement
	x += x_movement * _speed;
	y += y_movement * _speed;
}

//Setting states
function scr_set_states(){

	/*Directions
		down 0
		right 1
		up 2
		left 3
		
		up left 4
		up right 5
		
		down left 6
		down right 7
	
	*/

	//idle
	player_sprite[sprite_states.idle][0] = s_player_idle_down;
	player_sprite[sprite_states.idle][1] = s_player_idle_right;
	player_sprite[sprite_states.idle][2] = s_player_idle_up;
	player_sprite[sprite_states.idle][3] = s_player_idle_left;
	
	player_sprite[sprite_states.idle][4] = s_player_idle_up_left;
	player_sprite[sprite_states.idle][5] = s_player_idle_up_right;
	
	player_sprite[sprite_states.idle][6] = s_player_idle_down_left;
	player_sprite[sprite_states.idle][7] = s_player_idle_down_right;
	

	//walking
	player_sprite[sprite_states.walking][0] = s_player_walk_down;
	player_sprite[sprite_states.walking][1] = s_player_walk_right;
	player_sprite[sprite_states.walking][2] = s_player_walk_up;
	player_sprite[sprite_states.walking][3] = s_player_walk_left;
	
	player_sprite[sprite_states.walking][4] = s_player_walk_up_left;
	player_sprite[sprite_states.walking][5] = s_player_walk_up_right;
	
	player_sprite[sprite_states.walking][6] = s_player_walk_down_left;
	player_sprite[sprite_states.walking][7] = s_player_walk_down_right;

}
	