// Inherit the parent event
event_inherited();

//Check for collision with mouse
var _col_mouse = position_meeting(mouse_x, mouse_y, id);
var _left_mouse_button = mouse_check_button_pressed(mb_left);

//Change image index if the mouse button is hovering on the object
image_index = _col_mouse;

//If the player clicks on the button
if(_col_mouse && _left_mouse_button){

	//Do different things based on the button
	switch(my_text){
	
		//Back button
		case "Back":
		
			//Go back to the previous room
			room_goto_previous();
			
			//Return control to player
			global.player_control = true;
			
		break;
		
		//Try again button
		case "Try again":
			
			//Restart the room
			room_restart();
			
		break;
	
	}
	
}
