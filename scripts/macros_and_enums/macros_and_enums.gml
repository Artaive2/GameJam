#region MACROS

//The width and height of the map in tiles
#macro MAP_W 30
#macro MAP_H 18

#macro TILE_W 128
#macro TILE_H 62

#macro ROOM_W 480
#macro ROOM_H 288

#endregion

#region ENUMS

//Sprites states
enum sprite_states{

	idle,
	walking

}

//Moving directions
enum player_direction{

	down = 0,
	right = 1,
	up = 2
}

//Player states
enum player_states{

	moving,
	interacting

}

//UI elements
enum ui{

	prompt,
	textbox
	
}

//Tiles
enum Tile{

	Sprite, //0
	Z, //1
}

//Bobber states
enum bobber_state{

	cast,
	fishing,
	pulling,
	caught
	
}

//Dpad enum to use for sprites array instead of numbers
enum dpad{

	left,
	right,
	up,
	down
	
}

//Fish states
enum fish_states{

	bite,
	no_bite,
	failed_catch

}

//Fishes
enum fish_sizes{

	small = 1,
	medium = 5,
	large = 10

}

#endregion