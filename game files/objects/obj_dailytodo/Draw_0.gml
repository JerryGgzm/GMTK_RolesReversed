text_x_offset = camera_get_view_x(view_camera[0]);//change based on type of dialogue
text_y_offset = camera_get_view_y(view_camera[0]);

draw_set_halign(fa_left);
draw_set_font(Font_pixel_1);
draw_set_color(c_black);

draw_text(text_x_offset+x,text_y_offset+y,"Month:" + string(month[3-global.num_of_month_left]) + "\nAction Left:" + string(global.num_of_items_per_day));


draw_set_font(Font_pixel_1);