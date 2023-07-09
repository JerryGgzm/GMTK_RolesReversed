next_key = mouse_check_button_released(mb_left);//cant change to released b/c event was triggered by releasing

//textbox_x = camera_get_view_x(view_camera[0]);//change based on type of dialogue
//textbox_y = camera_get_view_y(view_camera[0]);

global.player_state = "PAUSE";

box_x = global.box_x;
box_y = global.box_y;

//============================setup
if prior_setup == false{
	prior_setup = true;
	//draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	page_number = array_length(text);
	for(var p = 0; p < page_number; p++){
		//number of chars in each page
		text_length[p] = string_length(text[p]);
			
		#region get the x pos of the textbox and the speaker
			if(speaker[p] == "npc"){
				var _textbox_x = obj_event_generator.x;//+ obj_event_generator.sprite_width/2;
				var _textbox_y = obj_event_generator.y - obj_event_generator.sprite_height/2;
			}else{
				var _textbox_x = box_x;
				var _textbox_y = box_y ;//- obj_mainchar.sprite_height/2;
			}
			if speaker[p] == "npc"{
					text_x_offset[p] = _textbox_x;
					text_y_offset[p] = _textbox_y;
			}else{
			
				text_x_offset[p] = _textbox_x;
				text_y_offset[p] = _textbox_y;
			
			}
			
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
				if (char[c,p] == " "){
					last_free_space_pos = _char_pos+1;//**to break after the space
				}
			
				//get line breaks
				if(_current_line_w - line_break_offset[p] > line_width){
					line_break_pos[line_break_num[p], p] = last_free_space_pos;
					line_break_num[p]++;
					var _text_upto_last_space = string_copy(text[p],1,last_free_space_pos);
					var _last_free_space_string = string_char_at(text[p],last_free_space_pos);//safer writing this way?
					line_break_offset[p] = string_width(_text_upto_last_space) - string_width(_last_free_space_string);
				
				}
			}
		#endregion
		
		#region getting each chars coordinates & set each chars default color
		for(var c = 0; c < text_length[p]; c ++){
		
			var _char_pos = c + 1;
			var _text_x = text_x_offset[p] + border;
			var _text_y = text_y_offset[p] + border;
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
			char_y[c, p] = _text_y + _text_line * line_sep;
			
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
if(next_key && char_index < text_length[page]){
	//if the typing is not done
	char_index = text_length[page];
}
else if(next_key && char_index == text_length[page]){
	//if the typing is done
	//change item/food/san... based on effect array=======
		if(effect[page] != ""){
			switch(effect[page]){
					
				case "email":
					global.sanity -= 10;
				break;
				
				
			}
		}
		
	if(page < page_number-1){
	//go next page if there's page left
		page ++;
		char_index = 0;
		
	}else{
	//destroy textbox if all pages finished
		//link text for options
		var wait_for_selection = false;
		var called_options = false;
		if(option_number > 0){//option exists
			if(option_selected){//option selected
				create_textbox(option_link_id[option_pos]);
				called_options = true;
			}else{
				wait_for_selection = true;
			}
		}else{
			if(speaker[page] == "npc" || speaker[page] == "reply"){
				obj_event_generator.spoken = true;
			}
		}	
		
		if(!called_options && !wait_for_selection){
			global.player_state = "FREE";
		}
		
		if(!wait_for_selection){
			instance_destroy();
		}
	}
		
}
	


//===============if animated:
//textbox_image += textbox_image_speed;



//=========================draw the textbox
var _textbox_x = box_x;
var _textbox_y = box_y ;

textbox_sprite_width = sprite_get_width(textbox_sprite);
textbox_sprite_height = sprite_get_height(textbox_sprite);

textbox_height = (line_break_num[page]+1) * line_sep + border * 2;

//draw textbox background
draw_sprite_ext(textbox_sprite,0,_textbox_x,_textbox_y,
textbox_width/textbox_sprite_width, textbox_height/textbox_sprite_height,0, c_white,1);


//=============================options
if(char_index == text_length[page] && page == page_number-1){
	
	//draw options
	op_offset_x = 16;
	option_ymargin = 2;
	option_selected = false;
	var _op_space = 28;//vertical distance btw options
	var _op_border = 16;//text border
	for(var op = 0; op < option_number; op++){
		var op_x = box_x;
	    var op_y = box_y + textbox_height*2 + 8;
		//draw option box dynamiclly
		var _op_width = string_width(option[op]) + 2*_op_border;
		
		draw_sprite_ext(textbox_sprite,0,op_x + op_offset_x,
						op_y-option_number*_op_space + op * _op_space,
						_op_width/textbox_sprite_width,(_op_space-option_ymargin)/textbox_sprite_height,0,c_white,1);
		
		//check if mouse on the option box
		var _op_colli_xi = op_x + op_offset_x;
		var _op_colli_yi = op_y-option_number*_op_space + op * _op_space;
		var _op_colli_xf = _op_colli_xi + _op_width;
		var _op_colli_yf = _op_colli_yi + _op_space-option_ymargin;
		if(mouse_x>_op_colli_xi && mouse_x<_op_colli_xf
		   && mouse_y>_op_colli_yi && mouse_y<_op_colli_yf){
			option_pos = op;
			option_selected = true;
			//draw arrow
			draw_sprite(spr_textbox_arrow,0,op_x,
						op_y-option_number*_op_space + op * _op_space);
		}
			
		//draw option text
		draw_text_color(op_x + op_offset_x + _op_border, 
					op_y-option_number*_op_space + op * _op_space + option_ymargin*2, option[op],
					default_option_color,default_option_color,default_option_color,default_option_color,1);
	}



}

//draw the text
for(var c = 0; c < char_index;c++){
	var yoffset = 0; 
	//the text
	draw_text_color( char_x[c,page], char_y[c,page] + yoffset,char[c,page],
					char_c1[c,page],char_c2[c,page],char_c3[c,page],char_c4[c,page],1);


}
