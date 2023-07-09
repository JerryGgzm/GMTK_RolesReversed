//PAUSE THE PLAYER
global.player_state = "PAUSE";

//textbox parameters
depth = -9998;

scale = 3;//= 3 to fit 864 * 640 screen
textbox_width = 176*scale;
textbox_height = 64*scale;
textbox_x_pos_center = 56*scale;
textbox_x_pos_left = 32*scale;
textbox_x_pos_right = 80*scale;
textbox_y_pos = 144*scale;

speaker_x_pos_left = 16*scale;
speaker_x_pos_right = 224*scale;


border = 8*scale;
line_sep = 12*scale;
line_width = textbox_width - border * 2;
textbox_sprite = spr_textbox_immediate;
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
speaker_sprite[0] = spr_mainchar_face;

prior_setup = false;

//set game text and color
default_text_color = c_black;
scr_game_text("char_narr");



