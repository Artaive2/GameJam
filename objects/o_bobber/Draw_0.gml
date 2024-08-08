draw_self();

//draw_text(5, 5, string(alarm[1]));
//draw_text(5, 20, string(alarm_timer) );

//If the fish is being pulled
if(my_state == bobber_state.pulling){
	
	//Variable to store dpad sprite and switch it when alarm 1 is triggered
	var _drawn_dpad = draw_sprite(dpad_sprite[dpad_sprite_num], image_index, x - 1, y + 2);
	
}