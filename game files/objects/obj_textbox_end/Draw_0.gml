next_key = mouse_check_button_pressed(mb_left);

textbox_x = camera_get_view_x(view_camera[0]);//change based on type of dialogue
textbox_y = camera_get_view_y(view_camera[0]) + textbox_y_pos;

//PAUSE THE PLAYER
global.player_state = "PAUSE";


//============================setup
if prior_setup == false{
	prior_setup = true;
	draw_set_font(FontSUM);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	page_number = array_length(text);
	for(var p = 0; p < page_number; p++){
		//number of chars in each page
		text_length[p] = string_length(text[p]);
			
		#region get the x pos of the textbox and the speaker
			//when no character is speaking( center
			text_x_offset[p] = textbox_x_pos_center;
			speaker_x_offset[p] = 0;
			
		#endregion
		
		#region setting break position of each line manually
			for(var c = 0; c < text_length[p]; c ++){
			
				var _char_pos = c + 1;//**string function starts at 1
			
				//store all individual chars
				char[c, p] = string_char_at(text[p],_char_pos);
			
				//get width of line we are typing
				var _text_upto_char = string_copy(text[p], 1, _char_pos);
				var _current_line_w = string_width(_text_upto_char)-string_width(char[c,p]);
			
				//find last free space
				if (char[c,p] == "&" || char[c,p] == " "){
					last_free_space_pos = _char_pos+1;//**to break after the space
				}
					
				//get line breaks
				if(char[c,p] == "&" || (_current_line_w - line_break_offset[p] > line_width)){
				 
					line_break_pos[line_break_num[p], p] = last_free_space_pos;
					line_break_num[p]++;
					var _text_upto_last_space = string_copy(text[p],1,last_free_space_pos);
					var _last_free_space_string = string_char_at(text[p],last_free_space_pos);//safer writing this way?
					line_break_offset[p] = string_width(_text_upto_last_space) - string_width(_last_free_space_string);
				
				}
				
				if (char[c,p] == "&"){
					char[c,p] = "";	
				}
				
			}
		#endregion
		
		#region getting each chars coordinates & set each chars default color
		for(var c = 0; c < text_length[p]; c ++){
		
			var _char_pos = c + 1;
			var _text_x = textbox_x + text_x_offset[p] + border;
			var _text_y = textbox_y + border;
			//get width of line we are typing
			var _text_upto_char = string_copy(text[p], 1, _char_pos);
			var _current_line_w = string_width(_text_upto_char)-string_width(char[c,p]);
			var _text_line = 0;	
			
			//compensate for string breaks
			for (var linebreak = 0; linebreak < line_break_num[p]; linebreak++){
				//if current char pos is after a line break
				if(_char_pos >= line_break_pos[linebreak,p]){
					var _str_copy = string_copy(text[p], line_break_pos[linebreak,p],_char_pos - line_break_pos[linebreak,p]);
					_current_line_w = string_width(_str_copy);
				
				 _text_line = linebreak + 1;
				
				}
			
			}
			
			//add to x, y coordinates
			char_x[c, p] = _text_x + _current_line_w;
			char_y[c, p] = _text_y + _text_line*line_sep;
			
		}
		#endregion
		
		
	}
}

//==============================typing the text
if(text_pause_timer <= 0){
	if(char_index < text_length[page]){
		if(!audio_is_playing(sound_typing)){
			audio_play_sound(sound_typing,12,true);
		}
		
		//check pause characters
		var _current_char = string_char_at(text[page],char_index);
		if(_current_char == "." || _current_char == "?"|| _current_char == "!"){
			text_pause_timer += text_pause_time;
		}else if(_current_char == ","){
			text_pause_timer += text_pause_time2;
		}
		
		char_index += text_speed;
		char_index = clamp(char_index, 0, text_length[page]);//limit this number to avoid bugs	
		
		

	}else{
		if(audio_is_playing(sound_typing)){
			audio_stop_sound(sound_typing);
		}
	}
}else{
	text_pause_timer--;
	if(audio_is_playing(sound_typing)){
			audio_stop_sound(sound_typing);
	}
}

//===============flip through pages & destroy textbox

if(next_key){
	//if the typing is done
	if(char_index == text_length[page]){
		if(page < page_number-1){
		//go next page if there's page left
			page ++;
			char_index = 0;
		}else{
		//if all pages finished and cliked, go next day
			goAnotherDay();
		}
	}else{
	//if typing not done
		char_index = text_length[page];
	}
}
	

//=========================draw the textbox
var _textbox_x = textbox_x + text_x_offset[page];
var _textbox_y = textbox_y;
textbox_sprite_width = sprite_get_width(textbox_sprite);
textbox_sprite_height = sprite_get_height(textbox_sprite);

//draw textbox background
//draw_sprite_ext(textbox_sprite,0,_textbox_x,_textbox_y,
//textbox_width/textbox_sprite_width, textbox_height/textbox_sprite_height,0, c_white,1);


//draw the text
for(var c = 0; c < char_index;c++){

	//the text
	draw_text_color( char_x[c,page], char_y[c,page],char[c,page],
					char_c1[c,page],char_c2[c,page],char_c3[c,page],char_c4[c,page],1);


}