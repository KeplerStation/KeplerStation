//THIS FILE CONTAINS CONSTANTS, PROCS, AND OTHER THINGS//
/////////////////////////////////////////////////////////

/mob/proc/setClickCooldown(var/timeout)
	next_move = max(world.time + timeout, next_move)

/proc/get_matrix_largest()
	var/matrix/mtrx=new()
	return mtrx.Scale(2)
/proc/get_matrix_large()
	var/matrix/mtrx=new()
	return mtrx.Scale(1.5)
/proc/get_matrix_norm()
	var/matrix/mtrx=new()
	return mtrx
/proc/get_matrix_small()
	var/matrix/mtrx=new()
	return mtrx.Scale(0.8)
/proc/get_matrix_smallest()
	var/matrix/mtrx=new()
	return mtrx.Scale(0.65)

/proc/get_racelist(var/mob/user)//This proc returns a list of species that 'user' has available to them. It searches the list of ckeys attached to the 'whitelist' var for a species and also checks if they're an admin.
	for(var/spath in subtypesof(/datum/species))
		var/datum/species/S = new spath()
		var/list/wlist = S.whitelist
		if(S.whitelisted && (wlist.Find(user.ckey) || wlist.Find(user.key) || user.client.holder))  //If your ckey is on the species whitelist or you're an admin:
			GLOB.whitelisted_species_list[S.id] = S.type 											//Add the species to their available species list.
		else if(!S.whitelisted)														//Normal roundstart species will be handled here.
			GLOB.whitelisted_species_list[S.id] = S.type

	return GLOB.whitelisted_species_list

	//Exotic Species
GLOBAL_LIST_EMPTY(exotic_tails_list)
GLOBAL_LIST_EMPTY(exotic_tails_animated_list)
GLOBAL_LIST_EMPTY(exotic_ears_list)
GLOBAL_LIST_EMPTY(exotic_head_list)
GLOBAL_LIST_EMPTY(exotic_back_list)

//Crew objective and miscreants stuff
GLOBAL_VAR_INIT(miscreants_allowed, FALSE)

/client/proc/reload_mentors()
		set name = "Reload Mentors"
		set category = "Admin"
		if(!src.holder)	return
		message_admins("[key_name_admin(usr)] manually reloaded mentors")

//Flavor Text
/mob/living/carbon/human/verb/set_flavor()
	set name = "Set Flavor Text"
	set desc = "Sets an extended description of your character's features."
	set category = "IC"

	var/new_flavor = input(src, "Enter your new flavor text:", "Flavor text", null) as message|null
	if(!isnull(new_flavor))
		flavor_text = sanitize(new_flavor)
		to_chat(src, "Your flavor text has been updated.")

//LOOC toggles
/client/verb/listen_looc()
	set name = "Show/Hide LOOC"
	set category = "Preferences"
	set desc = "Toggles seeing LocalOutOfCharacter chat"
	prefs.chat_toggles ^= CHAT_LOOC
	prefs.save_preferences()
	src << "You will [(prefs.chat_toggles & CHAT_LOOC) ? "now" : "no longer"] see messages on the LOOC channel."
	SSblackbox.record_feedback("tally", "admin_verb", 1, "TLOOC") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


