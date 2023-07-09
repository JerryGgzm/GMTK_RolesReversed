//if the actions points are used up, fading into the black scene
if (global.num_of_month_left != 1 && global.num_of_items_per_day == 0) {
	global.num_of_items_per_day = 2;
	var inst = instance_create_depth(0,0,-9999,obj_warp_narra_black);
	inst.target_room = target_room;
	
	if(global.zhoumu == 1){
		switch(global.num_of_month_left){
			case 3:
				inst.text_id = "month1_end";
				//inst.text_id = "month2";
				global.num_of_month_left -= 1;
			break;
		
			case 2:
				inst.text_id = "month2_end";
				//inst.text_id = "month3";
				global.num_of_month_left -= 1;
			break;
		
		}
	}else if(global.zhoumu == 2){
		switch(global.num_of_month_left){
			case 3:
				inst.text_id = "month1_end_2";
				//inst.text_id = "month2";
				global.num_of_month_left -= 1;
			break;
		
			case 2:
				inst.text_id = "month2_end_2";
				//inst.text_id = "month3";
				global.num_of_month_left -= 1;
			break;
		}
	}else{

	}
}

else if (global.num_of_month_left == 1 && global.num_of_items_per_day == 0) {
	global.num_of_month_left = 3;
	global.num_of_items_per_day = 2;
	if(global.zhoumu == 1){
		var inst = instance_create_depth(0,0,-9999,obj_warp_narra_black);
		inst.target_room = target_room;
		inst.text_id = "month3_end";
		global.notreset = true;
		global.mirror_interacted = false;
		global.shelf_interacted = false;
		global.desk_interacted = false;
		global.note_interacted = false;
		global.computer_interacted = false;
		global.window_interacted = false;
		global.curtain_interacted = false;
		global.bed_interacted = false;
	}else{
		var inst = instance_create_depth(0,0,-9999,obj_warp_narra_black);
		inst.target_room = target_room;
		inst.text_id = "month3_end_2";
	}
	global.zhoumu += 1;
	
}

