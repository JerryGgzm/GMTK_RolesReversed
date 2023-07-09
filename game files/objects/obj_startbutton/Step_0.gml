accept_key = mouse_check_button_pressed(mb_left);
if(mouse_x>x && mouse_x<x+sprite_get_width(sprite_index)
&& mouse_y>y && mouse_y<y+sprite_get_height(sprite_index)){
	
	image_index = 1;
	if(accept_key){
		audio_play_sound(snd_sound_click,10,false);
		mouse_clear(mb_left);
		var inst = instance_create_depth(0,0,-9999,obj_warp_narra_black);
		inst.target_room = Room_monthly_trans;
		inst.text_id = "intro";
	}
}else{
	image_index = 0;
}
