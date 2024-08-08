//pop prompt
function scr_prompt_pop(_object, _x, _y){

	//If the object passed exists
	if( instance_exists(_object) ){
	
		//If a prompt doesn't exist and a textbox doesn't exist
		if( !instance_exists(o_prompt) /* && !instance_exists(o_textbox) */){
		
			//Create a prompt if the ui layer exists
			if( layer_exists("layer_ui") ){
				
				prompt = instance_create_layer(_x, _y, "layer_ui", o_prompt);
				
			}
			
			return prompt;
			
		}
		
	}
	
}

///@ param object
///@ param [reset]

//remove prompt
function scr_prompt_remove(_object, _reset){

	//If the object is not undefined
	if( _object != undefined && instance_exists(_object) ){
	
		//Make the object fade out by changing it's fade_me value
		with(_object){
		
			fade_me = 2;
			
		}
		
		//If the player exists
		if( instance_exists(self) ){
		
			//Reset the pleyer prompt variable
			with(self){
			
				//Using a switch in case we have other ui elements we want to reset
				switch(_reset){
				
					//Prompt
					case ui.prompt:
					
						prompt = noone;
					
					break;
					
					//Textbox
					case ui.textbox:
					
						//textbox = noone;
					
					break;
					
					default:
					
						//Do nothing
						
					break;
					
				}
				
			}
			
		}
		
	}
	
}