if(room == target_room && image_index < 1){
	global.player_state = "FREE";
	obj_mainchar.x = target_x;
	instance_destroy();
}