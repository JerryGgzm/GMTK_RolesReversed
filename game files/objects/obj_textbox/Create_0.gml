//PAUSE THE PLAYER
global.player_state = "PAUSE";

//textbox parameters
depth = TEXTBOX;
textbox_width = 240;
textbox_height = 100;//change dynamically

border = 16;
line_sep = 20;
line_width = textbox_width - border * 2;
textbox_sprite = spr_textbox;

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

char[0, 0] = "";//[char , page]
char_x[0, 0] = 0;
char_y[0, 0] = 0;

//the options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;
option_selected = false;

//------------------text effects
default_text_color = c_black;
default_option_color = c_black;
scr_set_defaults_for_text();
last_free_space_pos = 0;
text_pause_timer = 0;
text_pause_time = 8;//for big pauses like . ? ! :
text_pause_time2 = 8;//for small pauses like ,

//affect food/item/sanity...
effect[0] = "";

//the speaker
speaker[0] = "mainchar";

prior_setup = false;
