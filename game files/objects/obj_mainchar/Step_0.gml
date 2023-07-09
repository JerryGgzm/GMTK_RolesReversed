switch(global.player_state){
	case "FREE":
	#region 
		//get movement
		xmove = move_speed*(move_right - move_left);

		//set the sprite and collision mask
		mask_index = char_sprite[RIGHT];
		if(xmove > 0){
			face = RIGHT;
		}else if(xmove < 0){
			face = LEFT;
		}else{
			image_index = 0;
		}
		sprite_index = char_sprite[face];

		//collision check
		if(place_meeting(x+xmove,y,obj_wall)){
			if(move_left){
				move_right = true;
				move_left = false;
			}else if(move_right){
				move_left = true;
				move_right = false;
			}
		}
	
		
		//move the character
		x += xmove;
		
	#endregion
	break;
	
	
	case "PAUSE":
	#region PAUSE STATE
		image_index = 0;
	#endregion
	break;
}


//Camera movement code:
//The x position we want to move the camera to (targetx) is player x - half of the camera width since the camera origin is at the top left corner
targetx = x - (camera_get_view_width(view_camera[0]) / 2);
//The y position we want to move the camera to (targetx) is player y - half of the camera height since the camera origin is at the top left corner
targety = y - (camera_get_view_height(view_camera[0]) / 2);
//We need the current position of the camera
currentx = camera_get_view_x(view_camera[0]);
currenty = camera_get_view_y(view_camera[0]);
//Set the camera position slowly towards the target position
camera_set_view_pos(view_camera[0], targetx * CAM_TARGET_PERCENTAGE + currentx * CAM_CURRENT_PERCENTAGE, targety * CAM_TARGET_PERCENTAGE + currenty * CAM_CURRENT_PERCENTAGE);

//Make the player "walk through" objects, creating a 3D effect
depth = -y;