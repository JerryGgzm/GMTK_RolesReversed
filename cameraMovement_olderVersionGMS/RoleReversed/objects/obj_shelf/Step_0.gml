if(!global.shelf_interacted && global.player_state == "FREE"){
	accept_key = mouse_check_button_released(mb_left);
	if(mouse_x>x && mouse_x<x+sprite_get_width(sprite_index)
	&& mouse_y>y && mouse_y<y+sprite_get_height(sprite_index)
	&& window_mouse_get_x()>20 && window_mouse_get_x() < (864-240)){
		
		image_index = SELECTED;
	
		if(accept_key){
			mouse_clear(mb_left);
			audio_play_sound(sound_click,10,false);
			create_new_textbox(text_id);
			image_index = DEFAULT;
		}
	}else{
		image_index = DEFAULT;
	}
}
else if(global.shelf_interacted){
	image_index = INTERACTED;
}
