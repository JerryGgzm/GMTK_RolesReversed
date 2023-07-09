
xmove = 0;
move_speed = 3;

char_sprite[RIGHT] = spr_mainchar_right;
char_sprite[LEFT] = spr_mainchar_left;
face = RIGHT;//default facing direction

depth = CHARACTER;

move_left = true;
move_right = false;

//Constants for camera movement
CAM_TARGET_PERCENTAGE = 0.2;
CAM_CURRENT_PERCENTAGE = 0.8;


// rondomly decide how long the character moves toward a direction
move_time = 500;