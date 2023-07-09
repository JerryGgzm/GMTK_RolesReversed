///@function scr_game_text(_text_id);
///@param {string} _text_id
function scr_game_text(_text_id){
	switch(_text_id){
		
		#region ITEM
				
			case "mirror":
				scr_text("A mirror.","","");
				scr_option("break","mirror_break");
				scr_option("cancel","mirror_cancel")
			break;
			
				case "mirror_break":
				scr_text("You broke it.","","");
				global.mirror_interacted = true;
				global.num_of_items_per_day -= 1;
				break;
				
				case "mirror_cancel":
				scr_text("Okay then.","","");
				break;
				
			
			case "shelf":
				scr_text("A shelf.","","");
				scr_option("break","shelf_break");
				scr_option("cancel","shelf_cancel")
			break;
			
				case "shelf_break":
					scr_text("You broke it.","","");
					global.shelf_interacted = true;
					global.num_of_items_per_day -= 1;
				break;
				
				case "shelf_cancel":
					scr_text("Okay then.","","");
				break;
				
				
			case "desk":
				scr_text("A desk.","","");
				scr_option("break","desk_break");
				scr_option("cancel","desk_cancel")
			break;
			
				case "desk_break":
					scr_text("You broke it.","","");
					global.desk_interacted = true;
					global.num_of_items_per_day -= 1;
				break;
				
				case "desk_cancel":
					scr_text("Okay then.","","");
				break;
				
			case "window":
				scr_text("A window.","","");
				scr_option("break","window_break");
				scr_option("cancel","window_cancel")
			break;
			
				case "window_break":
					scr_text("You broke it.","","");
					global.window_interacted = true;
					global.num_of_items_per_day -= 1;
				break;
				
				case "window_cancel":
					scr_text("Okay then.","","");
				break;
			
		#endregion
		
		#region MONTHLY SUMMARY
			case "month1":
				scr_text("A shadow moves into the house, waking you from your slumber. No one has had the audacity to reside in this haunted place for years, and you intend to stay this way. You are annoyed; you want him gone, you didn't get voted top haunted of the year for nothing.");
			break;

			case "intro":

				scr_text("A doctor in hiding, who experimented on people in hopes of saving his wife - from the deceased to the dying, with his last straw of morality.");
				scr_text("Unsuccessful, those who died in his hands guilt his consciousness while he grieves her death. He moved back to the place where he experimented on his last patient, a location close to the facility where his son currently resides.");
				scr_text("While in isolation, he grew unstable. He was eventually murdered, presumably by the family of the patient.");
					 
			break;
			
			case "char_narr":

				scr_text("I'm going to finish up my essay.","mainchar");
				
					 
			break;
			
		#endregion
		
	}
}