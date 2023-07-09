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
			
		#endregion
		
		#region MONTHLY SUMMARY
		
			case "summary":

				scr_text("Summary .... Summary .... Summary .... Summary .... Summary .... Summary .... Summary .... Summary .... Summary .... ");
					 
			break;
			
		#endregion
		
	}
}