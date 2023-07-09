//if the actions points are used up, fading into the black scene
if (global.num_of_month_left != 1 && global.num_of_items_per_day == 0) {
	global.num_of_items_per_day = 2;
	var inst = instance_create_depth(0,0,-9999,obj_warp_narra_black);
	inst.target_room = target_room;
	
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
}

else if (global.num_of_month_left == 1 && global.num_of_items_per_day == 0) {
	global.num_of_month_left = 3;
	global.num_of_items_per_day = 3;
	var inst = instance_create_depth(0,0,-9999,obj_warp_narra_black);
	inst.target_room = target_room;
	inst.text_id = "month3_end";
}

