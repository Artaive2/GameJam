//Set sprite
sprite_index = s_bobber;
image_speed = 3;


//Get the x and y of the mouse
target_x = mouse_x;
target_y = mouse_y;

//Position variables
target_reached = false;
thrown = false

//Animating variables
bobbing = .08;
splash = false;

//Fish catching variables
bite = false;
alarm_timer = 0;
escape_timer = irandom_range(100, 190);
dpad_sprite_num = irandom(3);
dpad_sprite_to_draw = undefined;
return_bobber = false;
fish_state = fish_states.no_bite;
//fish = 0;


prompt = noone;

//Bobber state
my_state = bobber_state.cast;

//Setting the dpad sprites based on key player should press
/*
	Left 0
	Right 1
	Up 2
	Down 3
*/

dpad_sprite[dpad.left] = s_dpad_left;
dpad_sprite[dpad.right] = s_dpad_right;
dpad_sprite[dpad.up] = s_dpad_up;
dpad_sprite[dpad.down] = s_dpad_down;