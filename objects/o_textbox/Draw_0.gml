if(o_game.game_section = "End"){
	
	//Drawing the sprite
	draw_self();

	//Set font for the size
	draw_set_font(f_main_small);
				
	//Set alignment
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
					
	//Back button variables for scaling
	var _x_scale = 1 / sprite_get_width(s_fishing_box) * (string_width(my_text) + 20);
	var _y_scale = 1 / sprite_get_height(s_fishing_box) * (string_height(my_text) + 20);

	//Fix the scale to fit the text		
	image_xscale = _x_scale;
	image_yscale = _y_scale;

	//Drawing the text	
	draw_text(x, y, my_text);

	//Reset alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

}