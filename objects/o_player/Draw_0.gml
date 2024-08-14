//Draw the object's sprite
draw_self();

//Drawing the fishing line if the bobber exists
if(instance_exists(o_bobber)){
		
	draw_line(x + 21, y  - 30, o_bobber.x, o_bobber.y);

}


//draw_text(10, 20, string(pull_amount));
//draw_text(10, 40, string(escape_amount));
