//textbox parameters
depth = -9998;
textbox_width = 670-290;
textbox_height = 500;
textbox_x_pos_center = 290;

textbox_y_pos = 100;

text_pause_timer = 0;

border = 16;
line_sep = 28;
line_width = textbox_width - border * 2;
textbox_sprite = spr_textbox2;
/*if textbox image is animated
textbox_image = 0;
textbox_image_speed = 0;//should be set to (fps of the sprite/60)
*/

//the text
page = 0;//page index, tells which dialogue we are on
page_number = 0;//how many pages
text[0] = "";
text_length[0] = string_length(text[0]);//store each text length
char_index = 0;
text_speed = 1;

//the options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

//the speaker face image
speaker_sprite[0] = noone;

prior_setup = false;
//------------------text effects
default_text_color = c_purple;
default_option_color = c_black;
scr_set_defaults_for_text();
last_free_space_pos = 0;
text_pause_timer = 0;
text_pause_time = 16;//for big pauses like . ? ! :
text_pause_time2 = 16;//for small pauses like ,