function scr_set_defaults_for_text(){
	line_break_pos[0,page_number] = 999;//[break pos, each page number]
	line_break_num[page_number] = 0;//the number of line breaks
	line_break_offset[page_number] = 0;//width in pixel to resize broken line
	
	for(var c = 0; c < global.largest_num_per_page; c++){
		char_c1[c,page_number] = default_text_color;
		char_c2[c,page_number] = default_text_color;
		char_c3[c,page_number] = default_text_color;
		char_c4[c,page_number] = default_text_color;
	}
}


///@function scr_text(_text);
///@param {string} _text
///@param {string} [character]
function scr_text(_text){
	scr_set_defaults_for_text();
	text[page_number] = _text;
	
	if(argument_count >1){
		
		switch(argument[1]){
			
			case "mainchar":
				speaker[page_number] = "mainchar";
			break;
			case "reply":
				speaker[page_number] = "reply";
			break;
			
		}
		
	}else{
		speaker[page_number] = "mainchar";
	}
	
	if(argument_count > 2){
		effect[page_number] = argument[2];
		
	}else{
		effect[page_number] = "";
	}
	
	page_number++;
}


#region TEXT effects
///@function scr_text_4color(_startpos,_endpos,_c1,_c2,_c3,_c4);
///@param {real} _startpos colored text start at
///@param {real} _endpos colored text end at
///@param {real} _c1
///@param {real} _c2
///@param {real} _c3
///@param {real} _c4
function scr_text_4color(_startpos,_endpos,_c1,_c2,_c3,_c4){
	if(page_number != 0){
	
		for(var i = _startpos; i < _endpos; i++){
			char_c1[i,page_number-1] = _c1;
			char_c2[i,page_number-1] = _c2;
			char_c3[i,page_number-1] = _c3;
			char_c4[i,page_number-1] = _c4;
		}
		
	}
}

///@function scr_text_color_specific(_startpos,_endpos,_c1);
///@param {real} _startpos colored text start at
///@param {real} _endpos colored text end at
///@param {real} _c1
function scr_text_color(_startpos,_endpos,_c1){
	
	if(page_number != 0){
		for(var i = _startpos; i < _endpos; i++){
			char_c1[i,page_number-1] = _c1;
			char_c2[i,page_number-1] = _c1;
			char_c3[i,page_number-1] = _c1;
			char_c4[i,page_number-1] = _c1;
		}
	}
}

#endregion

///@function scr_option(_option,_option_id);
///@param {string} _option
///@param {string} _option_id
function scr_option(_option, _option_id){
	option[option_number] = _option;
	option_link_id[option_number] = _option_id;
	
	option_number++;
}

///@function create_textbox(_text_id);
///@param {string} _text_id
///@param {string} [is_immediate]
function create_textbox(_text_id){
	with (instance_create_depth(0,0,-999,obj_textbox)){
		if(argument_count > 1){
			immediate = argument[1];
		}
		scr_game_text(_text_id);
	}
}

function create_new_textbox(_text_id){
	set_global_box_xy();
	with (instance_create_depth(0,0,-999,obj_textbox)){
		if(argument_count > 1){
			immediate = argument[1];
		}
		scr_game_text(_text_id);
	}
}


function set_global_box_xy(){
	global.box_x = mouse_x;
	global.box_y = mouse_y;
}



function goAnotherRoom(){
	if(room == Room2){
			audio_play_sound(sound_click,10,false);
			var inst = instance_create_depth(0,0,-9999,obj_warp_black);
			inst.target_room = Room3;
			inst.target_x = 200;
	}else{
		audio_play_sound(sound_click,10,false);
		var inst = instance_create_depth(0,0,-9999,obj_warp_black);
			inst.target_room = Room2;
			inst.target_x = 200;
	}
}

function goAnotherDay(){

	var inst = instance_create_depth(0,0,-9999,obj_warp_black);
	inst.target_room = Room2;
	inst.target_x = 200;
	
}

///@function create_end_textbox(_text_id);
///@param {string} _text_id
///@param {string} [is_immediate]
function create_end_textbox(_text_id){
	with (instance_create_depth(0,0,-999,obj_textbox_end)){
		if(argument_count > 1){
			immediate = argument[1];
		}
		scr_game_text(_text_id);
	}
}

