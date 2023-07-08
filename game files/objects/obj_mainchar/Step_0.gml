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