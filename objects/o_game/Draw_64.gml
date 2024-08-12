

//Draw the score of the minigames based on which mini game it is
switch(room){

	//Fishing mini game
	case RM_Fishing_MiniGame:
		
		//Control
		var _left_mouse_button = mouse_check_button_pressed(mb_left);
		
		//Multi-use local variables
		var _half_window_width = window_get_width() / 2;
		var _half_window_height = window_get_height() / 2;
		
			
		//Set the color and font
		draw_set_font(f_main);
		draw_set_color(#c4f0c2);
			
			
		//Switch what to draw based on three conditions: Start of the game, during the game, end of the game
		switch(game_section){
		
			#region Start
			
			//Start of the game
			case "Start":
				
				//Disable control
				global.player_control = false;
				
				
				//Set the color and font
				draw_set_font(f_main);
				draw_set_color(#c4f0c2);
				
				//Set the vertical and horizontal alignment
				draw_set_valign(fa_middle);
				draw_set_halign(fa_center);
				
				//text to draw on the starting box
				var _text = "Pulling fish \n \n \n \nCast rod";
			
				//Draw the box
				draw_sprite_ext(s_fishing_textbox, 0, _half_window_width, _half_window_height, 20, 20, 0, c_white, .9);
				
				//Fix horizontal alignment to the left for the text to be drawn from the left
				draw_set_halign(fa_left);
				
				//Draw text
				draw_text_ext_transformed(_half_window_width / 2 - 50, _half_window_height - 100, _text, 40, 500, 1.5, 1.5, 0);
				
				//Draw control buttons
				draw_sprite_ext(s_buttons, 0, _half_window_width + 120, _half_window_height - 200, 2, 2, 0, c_white, 1);
				
				
				//Fixing the speed of the sprite before drawing
				image_speed = .02;
				
				//Draw mouse for casting rod
				draw_sprite_ext(s_mouse, image_index, _half_window_width + 120, _half_window_height + 40, 2, 2, 0, c_white, 1);
				
				//Fix the horizontal aligment for the bottom text
				draw_set_halign(fa_center);
				
				//Showing which button to press to proceed
				draw_text(_half_window_width, _half_window_height + 250, "Click anywhere to start");
				
				//Return aligments to default
				draw_set_valign(fa_top);
				draw_set_halign(fa_left);
				
				//IF the player clicks the left mouse button, start game
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
			
				//If it's not game over, draw the score and time
				if(fishing_time_limit > 0 && game_section = "During"){
		
					//Variables for both
					var _y = 15;
					var _x = 10;
		
					#region Drawing score
		
					//Set the horizontal alignment for the score (right of the screen)
					draw_set_halign(fa_right);
	
					//Draw the score
					draw_text( window_get_width() - _x , _y, "Score: " + string(global.fishing_game_score) );
		
					#endregion
		
					#region Drawing time
		
					//Set the horizontal alignment for the time (left of the screen)
					draw_set_halign(fa_left);
		
					//Draw the time limit
					draw_text(_x, _y, "Time: " + string(fishing_time_limit) );
			
					#endregion
					
				}
				
			break;
			
			#endregion
		
		}
			
		
		#region After game
		
		//If the time limit ran out
		if(fishing_time_limit <= 0){
			
			//Stop player contol
			global.player_control = false;
			
			
			//Set the vertical and horizontal alignment
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			
			
			//Draw a background
			draw_sprite_ext(s_fishing_textbox, 0, _half_window_width, _half_window_height, 35, 10, 0, c_white, .9);
			
			//Draw the game over text
			draw_text_transformed( _half_window_width, _half_window_height, "GAME OVER", 5, 5, 0);
			
			//Draw the score under the 'game over' text
			draw_text( _half_window_width, _half_window_height + 120, "Score: " + string(global.fishing_game_score) );
			
			//Return aligments to default
			draw_set_valign(fa_top);
			draw_set_halign(fa_left);
			
		}
		
		//Return the color to the default value
		draw_set_color(c_white);
		
		#endregion
		
	break;

}
