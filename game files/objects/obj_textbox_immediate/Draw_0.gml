global.player_state = "PAUSE";

next_key = mouse_check_button_released(mb_left);
mouse_clear(mb_left);

textbox_x = camera_get_view_x(view_camera[0]);//change based on type of dialogue
textbox_y = camera_get_view_y(view_camera[0]) + textbox_y_pos;

//==============setup
if prior_setup == false{
	prior_setup = true;
	draw_set_font(Font_pixel_1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	page_number = array_length(text);
	for(var p = 0; p < page_number; p++){
		//number of chars in each page
		text_length[p] = string_length(text[p]);
		//get the x pos of the textbox and the speaker
			
			if(true){
				//when main character is speaking( left
				text_x_offset[p] = textbox_x_pos_right;
				speaker_x_offset[p] = speaker_x_pos_left;
			}else{
				//when no character is speaking( center
				text_x_offset[p] = textbox_x_pos_center;
				speaker_x_offset[p] = 0;
			}
			
	}
}

//===============typing the text
if(char_index < text_length[page]){
	if(!audio_is_playing(sound_typing)){
		audio_play_sound(sound_typing,12,true);
	}
	char_index += text_speed;
	char_index = clamp(char_index, 0, text_length[page]);//limit this number to avoid bugs	
}else{
	if(audio_is_playing(sound_typing)){
		audio_stop_sound(sound_typing);
	}
}

//===============flip through pages & destroy textbox
if(next_key){
	//if the typing is done
	if(char_index == text_length[page]){
		
		if(page == 15){
			global.bobleft = true;
		}
		
		//go next page if there's page left
		if(page < page_number-1){
			page ++;
			char_index = 0;
		}else{
		//destroy textbox if all pages finished
			//link text for options
			if(option_number > 0){//option exists
				create_textbox(option_link_id[option_pos]);
			}
			global.player_state = "FREE";
			instance_destroy();
		}
	}else{
	//if typing not done
		char_index = text_length[page];
	}
}
	


//===============if animated:
//textbox_image += textbox_image_speed;

//============draw the textbox
var _textbox_x = textbox_x + text_x_offset[page];
var _textbox_y = textbox_y;
textbox_sprite_width = sprite_get_width(textbox_sprite);
textbox_sprite_height = sprite_get_height(textbox_sprite);

//draw textbox background
draw_sprite_ext(textbox_sprite,0,_textbox_x,_textbox_y,
textbox_width/textbox_sprite_width, textbox_height/textbox_sprite_height,0, c_white,1);

//draw face if needed
if(speaker_x_offset[page] != 0){
	var _speaker_x = textbox_x + speaker_x_offset[page];
	var _speaker_y = textbox_y;

	draw_sprite_ext(textbox_sprite,0,_speaker_x,_speaker_y,
	50*scale/textbox_sprite_width, 50*scale/textbox_sprite_height,0,c_white,1);
	draw_sprite(speaker_sprite[page],0,_speaker_x,_speaker_y);
}

//===============options
if(char_index == text_length[page] && page == page_number-1){
	
	//option selection
	if (keyboard_check_pressed(vk_down)){
		option_pos += 1;
		//show_message(string(option_pos));
	}else if(keyboard_check_pressed(vk_up)){
		option_pos -= 1;
		//show_message(string(option_pos));
	}
	if(option_pos >= option_number){
		//show_message("optionpos max");
		option_pos = 0;
	}else if(option_pos < 0){
		//show_message("optionpos min");
		option_pos = option_number-1;
	}
	option_pos = clamp(option_pos,0,option_number);
	
	//draw options
	op_offset_x = 16;
	option_ymargin = 2;
	var _op_space = 15;//vertical distance btw options
	var _op_border = 4;//text border
	for(var op = 0; op < option_number; op++){
		//draw option box dynamiclly
		var _op_width = string_width(option[op]) + 2*_op_border;
		draw_sprite_ext(textbox_sprite,0,_textbox_x + op_offset_x,_textbox_y-option_number*_op_space + op * _op_space,
			_op_width/textbox_sprite_width,(_op_space-option_ymargin)/textbox_sprite_height,0,c_white,1);
	
		//draw arrow
		if(option_pos == op){
			draw_sprite(spr_option_arrow,0,_textbox_x,_textbox_y-option_number*_op_space + op * _op_space);
		}
		
		//draw option text
		draw_text(_textbox_x + op_offset_x + _op_border, _textbox_y-option_number*_op_space + op * _op_space + option_ymargin*2, option[op]);
	}

}

//draw the text
var _drawtext = string_copy(text[page],1,char_index);//***string starts at 1!
draw_text_ext(_textbox_x + border, _textbox_y+border,_drawtext,line_sep,line_width);