if(!global.window_interacted && global.player_state == "FREE"){
	var _accept_key = mouse_check_button_released(mb_left);
	if(mouse_x>x && mouse_x<x+sprite_get_width(sprite_index)
	&& mouse_y>y && mouse_y<y+sprite_get_height(sprite_index)
	&& window_mouse_get_x()>20 && window_mouse_get_x() < (864-240)){
		
		image_index = SELECTED;

	
		if(_accept_key){
			var _x_pos = camera_get_view_x(view_camera[0]);
			var _y_pos = camera_get_view_y(view_camera[0]);
			screenshake(540, 30, 2, _x_pos, _y_pos);
			mouse_clear(mb_left);
			show_debug_message("entered");
			audio_play_sound(snd_sound_click,10,false);
			create_new_textbox(text_id);
			
			image_index = DEFAULT;
		}
	}else{
		image_index = DEFAULT;
	}
}
else if(global.window_interacted){
	image_index = INTERACTED;
}
