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
				
			case "computer":
				scr_text("A computer.","","");
				scr_option("break","computer_break");
				scr_option("cancel","computer_cancel")
			break;
			
				case "computer_break":
				scr_text("You broke it.","","");
				global.computer_interacted = true;
				global.num_of_items_per_day -= 1;
				break;
				
				case "computer_cancel":
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
		
		#region MONTHLY SUMMARY - 1
			case "month1":
				scr_text("A shadow moves into the house, waking you from your slumber. No one has had the audacity to reside in this haunted place for years, and you intend to stay this way. You are annoyed; you want him gone, you didn't get voted top haunted of the year for nothing.");
				scr_text("You are annoyed; you want him gone, you didn't get voted top haunted of the year for nothing.");
			break;
			
			case "month1_end":
				scr_text("Computer log...");
				scr_text("You used up all your energy, uncontrollable exhaustion creeps up your mind.");
			break;
			
			case "month2":
				scr_text("You have risen again, the original pungent smell of medical equipment has diluted.");
				scr_text("It's been a month of harassing the heck out of him, but he seems unphased by your effort. “Am I getting old?” You think to yourself profusely. While denial crawls up the roof, you decide to be more aggressive, in hopes of finally booting him out of your turf.");
				scr_text("Have you changed? You wonder if your heart was softened because of his companionship.");
			break;
			
			case "month2_end":
				scr_text("Computer log...");
				scr_text("'STOP TALKING TO ME' he exclaims, staring deep into your walls. 'Leave me alone.. Please…' (Phase two sprite with eyes) 'Maria… Baby…' He weeps, 'I really tried.'");
				scr_text("You wonder who he is talking to. It doesn't seem to be you, his utter despair infects your very existence as your ridge shivers. Alas, the sense of compassion from such familiar isolation made you wonder whether to tone down your mischief. ");
				scr_text("'I know the other child was innocent, but he was on the brink of demise… Would he not have been happy, knowing his sacrifice contributed to saving… an attempt to save someone's life?'");
				scr_text("You feel a familiar mixture of pain, anger, and fear…");
				scr_text("You used up all your energy, uncontrollable exhaustion creeps up your mind.");
			break;
			
			case "month3":
				scr_text("You see him now, a man in a medical blouse. You feel an uncontrollable fear, an urge pushing you to flee as far as possible. With a click, you feel safe again.");
			break;
			
			case "month3_end":
				scr_text("'This house seems to have some sort of consciousness, while I am Agnostic, it is to be seriously considered whether there are unacknowledged forces at play.' the doctor huffs into his microphone, '... But it is good to know I am not alone.'");
				scr_text("You used up all your energy, uncontrollable exhaustion creeps up your mind.");
			break;
			
			case "Play1_end":
				scr_text("You hear a gasp. You see the doctor collapsed on the ground.");
				scr_text("'Maria… I have flown too close to the sun, I just want to be closer to our boy.'");
				scr_text("You have much to ask, so many questions, but you had no way of asking. You feel avenged, but also sad, and lonely.");
				scr_text("'Sorry pal, I couldn't be a father to you.' His quenched fingers quiver on your floor, as he is drenched in his own blood, staring out the window, murmuring 'I suppose your family felt the same, hence this knife in my flesh… Would it have been different if I were to simply turn myself in? Or to have simply never prioritized one life above another?' ");
				scr_text("You struggle to stay conscious while being torn apart by a wrenching pain as if something has tapped into your existence, wiping you away. ");
				scr_text("Some sort of bizarre reset.");
				scr_text("Death doesn't pull you apart; you are no longer alone.");
			break;
				
			
			case "char_narr":
				scr_text("I'm going to finish up my essay.","mainchar");
				 
			break;
			
		#endregion
		
		
		#region MONTHLY SUMMARY - 2
			case "month1_2":
				scr_text("A shadow moves into the house, waking you from your slumber. No one has had the audacity to reside in this haunted place for years. ");
				scr_text("You feel familiar; he is familiar, why is he familiar? He needs to go, for the sake of his own, or is it for the sake of me? Are we stopping him from something? Some sort of force pushing us apart, is it death?");		
				scr_text("I'm going to finish up my essay.","mainchar");
			break;
			
			case "month1_end_2":
				scr_text("Computer log...");
				scr_text("You used up all your energy, uncontrollable exhaustion creeps up your mind.");
			break;
			
			case "month2_2":
				scr_text("You have risen again, the original pungent smell of medical equipment has diluted.");
				scr_text("It's been a month of harassing the heck out of him, but he seems unphased by your effort. “Am I getting old?” You think to yourself profusely. While denial crawls up the roof, you decide to be more aggressive, in hopes of finally booting him out of your turf.");
				scr_text("Have we changed? You wonder if your heart was softened because of his companionship.");
				scr_text_color(5,7,c_red);
			break;
			
			case "month2_end_2":
				scr_text("'What a coward,' he disdains, 'what an arrogant god-complexed fool, he is no father of mine.'");
				scr_text("You used up all your energy, uncontrollable exhaustion creeps up your mind.");	
				
			break;
			
			case "month3_2":
				scr_text("You see him now, a man in a detective suit. You feel an uncontrollable closeness, a tearful urge pushing you to talk to him. With a click, you feel numb again.");
			break;
			
			case "month3_end_2":
				scr_text("This house seems to have some sort of consciousness, while I am Agnostic, it is to be seriously considered whether there are unacknowledged forces at play.' the doctor huffs into his microphone, '... But it is good to know I am not alone.");
				scr_text("...");
				scr_text("'This will be my one and only entry. Let me first address the elephant in the room. My father is and always will be in the wrong. There is no moral high ground that allows such a utilitarian zero-sum exchange of human life, as proclaimed by Immanuel Kant, humans shall never be treated as means. As such a man in isolation has lost control, the dichotomy with such a sinned environment is altered, a direct contrast of the child he murdered in the name of my mother…'");
				scr_text("Your exhaustion seemingly went away, as if there was nothing more holding down your existence. You feel free. ");
				scr_text("The speech kept going, as you uncovered the doctor's past, and knew that it is also your past, a testament to the vice and a revelation of the dichotomies - between a house and its resident, the patient to a doctor, children to fathers, strangers to blood, and morality to choice.");
				scr_text("Eventually, the detective stood up, ");
				scr_text("'He was a troubled man.' the detective sighed, 'House, would you tell me what kind of man he was?'");
			break;
			
			case "Play2_end":
				scr_text("Thank you for playing...");
			break;
				
		#endregion
		
	}
}