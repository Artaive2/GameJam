//Set sprite
sprite_index = s_bobber;

//Get the x and y of the mouse
target_x = mouse_x;
target_y = mouse_y;

//Position variables
target_reached = false;
thrown = false

//Bobbing variables
bobbing = .08;

//Fish catching variables
bite = false;
alarm_timer = 0;
escape_timer = 190;

prompt = noone;

//Bobber state
my_state = bobber_state.thrown;

