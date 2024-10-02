
switch(room){
	
	//Arcade room
	case RM_Arcade_iso:
	
		
		
		#region Detecting light sources
		
		/*
		
		//Mean local variables
		var _number = 0;
		var _sum_x = 0;
		var _sum_y = 0;
		
		//If the variable does not contain a ds list, create a ds list to store machines that are lit in
		if (nearby_lights_list = -1 || nearby_lights_list = undefined){ 
			
			//Create a ds list
			nearby_lights_list = ds_list_create();
			
			//Clear the list of pre existing data
			ds_list_clear(nearby_lights_list);
			
		}
		
		//If the variable does not contain a ds list, create a ds list to store all machines in
		if(nearby_machines_list = -1 || nearby_machines_list = undefined){
			
			//Create a ds list
			nearby_machines_list = ds_list_create();
			
			//Clear the list of preexisting data
			ds_list_clear(nearby_machines_list);
			
		}
		
		//Store all nearby machines
		var _nearby_machines = collision_rectangle_list(x - light_range, y - light_range, x + light_range, y + light_range, o_arcade_machine, false, true, nearby_machines_list, true);
		
		//Check through every nearby machine and if they are light sources store them in the light ds list
		for(var i = 0; i < _nearby_machines - 1; i++){
		
			//Store the current nearby machine to check for easy use
			var _machine = nearby_machines_list[| i];
			
			//Check if the current nearby machine to check is a light source
			if( _machine.light_source = true){
				
				//If it is, store it in the light sources ds list
				nearby_lights_list[| i] = nearby_machines_list[| i];
				
				//Add to the sum of the x and y to find the mean location of all the light sources
				_sum_x += _machine.x;
				_sum_y += _machine.y;
				draw_text(x, y, string(_machine) );
			}
			
		}
		
		
		
		//TEST: Figuring out how to find the mean of the nearby machines
		if( ds_list_size(nearby_lights_list) > 0){
			
			//mean()
			
		}
		
		*/
		
		
		//Get the nearest arcade machine
		var _nearest_machine = instance_nearest(x, y, o_arcade_machine);
		
		var _distance = ( point_distance(x, y, _nearest_machine.x, _nearest_machine.y) / 18 );
		
		var _alpha_dev =  1 / _distance;
			
		//Shadow
		//gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(s_player_idle_down, 0, x, y, .8, 1 / _distance, point_direction(x, y, _nearest_machine.x, _nearest_machine.y) + 90, c_black, _alpha_dev);
		//gpu_set_blendmode(bm_normal);
		
		
		
		#endregion
		
		//Draw the object's sprite last so it is drawn on top of the shadow
		draw_self();
		
		#region Detecting machines
		
		//If the player is nearby a machine 
		if(nearby_machine){
				
			//Pop a prompt
			//prompt = scr_prompt_pop(_nearby_machine, _nearby_machine.x, _nearby_machine.y - _nearby_machine.sprite_height);
			prompt = draw_sprite_ext(nearby_machine.highlight_shape, 0, nearby_machine.x, nearby_machine.y - 1, 1.2, 1.2, 0, c_white, 1);
					
		}
				
		//If not nearby a machine, remove the prompt
		if(!nearby_machine /* && !_nearby_npc */){
			
			prompt = noone;
					
		}
		
		#endregion
		
	break;
	
	//Fishing mini game
	case RM_Fishing_MiniGame:
	
		//Draw the object's sprite
		draw_self();
		
		//Drawing the fishing line if the bobber exists
		if(instance_exists(o_bobber)){
		
			draw_line(x + 21, y  - 30, o_bobber.x, o_bobber.y);

		}
		
	break;

}
