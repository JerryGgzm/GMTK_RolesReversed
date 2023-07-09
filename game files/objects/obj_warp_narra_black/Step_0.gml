if(room == target_room && image_index < 1){
	global.player_state = "FREE";
	var inst = instance_create_depth(0,0,-9999,obj_youlose);
	inst.text_id = text_id;
	
	instance_destroy();
}