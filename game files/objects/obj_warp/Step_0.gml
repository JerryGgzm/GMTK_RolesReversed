if(room == target_room && image_index < 1){
	global.player_state = "FREE";
	instance_destroy();
}