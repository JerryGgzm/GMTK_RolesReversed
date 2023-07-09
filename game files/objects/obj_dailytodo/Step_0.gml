/// @description Insert description here
// You can write your code in this editor

//if the actions points are used up, fading into the black scene
if (global.num_of_items_per_day == 0) {
	global.num_of_month_left -= 1;
	global.num_of_items_per_day = 3;
	var inst = instance_create_depth(0,0,-9999,obj_warp);
	inst.target_room = target_room;
}

