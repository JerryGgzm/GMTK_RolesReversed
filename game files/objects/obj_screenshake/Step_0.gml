/// @description Insert description here
// You can write your code in this editor

if (shake)
{
	shake_time -= 1;
	var _xval = current_cam_x + choose(-shake_magnitude, shake_magnitude);
	var _yval = current_cam_y + choose(-shake_magnitude, shake_magnitude);
	camera_set_view_pos(view_camera[0], _xval, _yval);
	
	if (shake_time >= 0) {
		shake_magnitude -= shake_fade;
		
		if (shake_magnitude <= 0)
		{
			camera_set_view_pos(view_camera[0], current_cam_x, current_cam_y);
			shake = false;
		}
		
	}
	
}
