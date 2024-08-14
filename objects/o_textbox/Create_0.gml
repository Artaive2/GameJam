// Inherit the parent event
event_inherited();

my_text = "";



//Change sprite based on room
switch(room){

	//In the fishing mini game
	case RM_Fishing_MiniGame:
	
		//Set sprite
		sprite_index = s_fishing_box;
		
		//Set speed to 0
		image_speed = 0;
	
	break;

}