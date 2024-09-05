#region Variables

shadow_angle = 0;

//Movement variables
dir = 0;
x_movement = 0;
y_movement = 0;
spd = 3;
diagonal_spd = .7;
acceleration = .5;

//Detecting instances
look_range = 10;
prompt = noone;
text_box = noone;
nearby_machine = noone;

//Fishing game variables
fishing = false;
fishing_dpad = "";
bobber_just_destroyed = false;
escape_amount = 0;
pull_amount = 0;

alarm_timer = 10;

//States variables
sprite_state = sprite_states.idle;
state = player_states.moving;

#endregion

//Set states
scr_set_states();