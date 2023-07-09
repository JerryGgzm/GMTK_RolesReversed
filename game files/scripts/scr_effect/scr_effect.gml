///@function screenshake(_time, _magnitude, _fade, _current_cam_x, _current_cam_y);
/// @param  {real}  _time       The length of time - in steps - to shake the screen
/// @param  {real}  _magnitude  The amount of screenshake to apply
/// @param  {real}  _fade       How quickly the screenshake effect will fade out
/// @param  {real}  current_cam_x    current camera position x
/// @param  {real}  current_cam_y    current camera position y
/// @description    Set the screenshake object variables.

function screenshake(_time, _magnitude, _fade, _current_cam_x, _current_cam_y)
{
	with (obj_screenshake_1) {
		shake = true;
		shake_time = _time;
		shake_magnitude = _magnitude;
		shake_fade = _fade;
		current_cam_x = _current_cam_x;
		current_cam_y = _current_cam_y;
	}
}