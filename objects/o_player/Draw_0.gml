//Draw the object's sprite
draw_self();

//Drawing the fishing line
if(instance_exists(o_bobber)){
		
	draw_line(x, y, o_bobber.x, o_bobber.y);
	
}

draw_text(10, 10, string(global.dpad_to_press));
draw_text(10, 20, string(fishing_dpad));
