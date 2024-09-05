

switch(room){
	
	//Arcade room
	case RM_Arcade_iso:
	
		//If the player is nearby a machine 
		if(nearby_machine){
				
			//Pop a prompt
			//prompt = scr_prompt_pop(_nearby_machine, _nearby_machine.x, _nearby_machine.y - _nearby_machine.sprite_height);
			prompt = draw_sprite_ext(s_arcade_machine_2_front_highlight, 0, nearby_machine.x, nearby_machine.y - 1, 1.2, 1.2, 0, c_white, 1);
					
		}
				
		//If not nearby a machine, remove the prompt
		if(!nearby_machine /* && !_nearby_npc */){
			
			prompt = noone;
					
		}
		
		//Get the nearest arcade machine
		var _nearest_machine = instance_nearest(x, y, o_arcade_machine);
		var _alpha_dev =  1 / ( point_distance(x, y, _nearest_machine.x, _nearest_machine.y) / 8);
			
		//Shadow
		//gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(s_player_idle_down, 0, x, y, .8, .4, point_direction(x, y, _nearest_machine.x, _nearest_machine.y) + 90, c_black, _alpha_dev);
		//gpu_set_blendmode(bm_normal);
		
		//Draw the object's sprite
		draw_self();
		
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

//draw_text(10, 20, string(pull_amount));
//draw_text(10, 40, string(escape_amount));
