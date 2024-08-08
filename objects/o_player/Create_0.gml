#region Variables

//Movement variables
dir = 0;
x_movement = 0;
y_movement = 0;
spd = 3;
diagonal_spd = .7;
acceleration = .5;

//Detecting instances
look_range = 1;
prompt = noone;
text_box = noone;

//Fishing game variables
fishing = false;
bobber_x = 0;
bobber_y = 0;

//States variables
sprite_state = sprite_states.idle;
state = player_states.moving;

#endregion

//Set states
scr_set_states();