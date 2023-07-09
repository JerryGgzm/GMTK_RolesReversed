accept_key = mouse_check_button(mb_left);
if(mouse_x>x && mouse_x<x+sprite_get_width(sprite_index)
&& mouse_y>y && mouse_y<y+sprite_get_height(sprite_index)){
	
	image_index = 1;
	if(accept_key){
		audio_play_sound(sound_click,10,false);
		var inst = instance_create_depth(0,0,-9999,obj_warp);
		inst.target_room = target_room;
	}
}else{
	image_index = 0;
}
