#define EMOTE_COOLDOWN 20		//Time in deciseconds that the cooldown lasts

//Emote Cooldown System (it's so simple!)
/mob/proc/handle_emote_CD(cooldown = EMOTE_COOLDOWN)
	if(emote_cd == 3) //Spam those emotes
		return FALSE
	if(emote_cd == 2) // Cooldown emotes were disabled by an admin, prevent use
		return TRUE
	if(emote_cd == 1)  // Already on CD, prevent use
		return TRUE

	emote_cd = TRUE	// Starting cooldown
	spawn(cooldown)
		if(emote_cd == 2)
			return TRUE // Don't reset if cooldown emotes were disabled by an admin during the cooldown
		emote_cd = FALSE // Cooldown complete, ready for more!
	return FALSE // Proceed with emote

//--FalseIncarnate

/mob/proc/handle_emote_param(target, not_self, vicinity, return_mob) //Only returns not null if the target param is valid.
	var/view_vicinity = vicinity ? vicinity : null									 //not_self means we'll only return if target is valid and not us
	if(target)																		 //vicinity is the distance passed to the view proc.
		for(var/mob/A in view(view_vicinity, null))									 //if set, return_mob will cause this proc to return the mob instead of just its name if the target is valid.
			if(target == A.name && (!not_self || (not_self && target != name)))
				if(return_mob)
					return A
				else
					return target

// All mobs should have custom emote, really..
/mob/proc/custom_emote(m_type = EMOTE_VISUAL, message = null)

	if(stat || !use_me && usr == src)
		if(usr)
			to_chat(usr, "You are unable to emote.")
		return

	var/input
	if(!message)
		input = sanitize(copytext(input(src,"Choose an emote to display.") as text|null,1,MAX_MESSAGE_LEN))
	else
		input = message
	if(input)
		message = "<B>[src]</B> [input]"
	else
		return


	if(message)
		log_emote(message, src)

 //Hearing gasp and such every five seconds is not good emotes were not global for a reason.
 // Maybe some people are okay with that.

		for(var/mob/M in GLOB.player_list)
			if(!M.client)
				continue //skip monkeys and leavers
			if(istype(M, /mob/dead/new_player))
				continue
			if(findtext(message," snores.")) //Because we have so many sleeping people.
				break
			if(M.stat == DEAD && M.get_preference(CHAT_GHOSTSIGHT) && !(M in viewers(src,null)))
				M.show_message(message)


		// Type 1 (Visual) emotes are sent to anyone in view of the item
		if(m_type & EMOTE_VISUAL)
			var/list/can_see = get_hearers_in_view(1, src)  //Allows silicon & mmi mobs carried around to see the emotes of the person carrying them around.
			can_see |= viewers(src,null)
			for(var/mob/O in can_see)
				O.show_message(message, m_type)

		// Type 2 (Audible) emotes are sent to anyone in hear range
		// of the *LOCATION* -- this is important for pAIs to be heard
		else if(m_type & EMOTE_SOUND)
			for(var/mob/O in get_hearers_in_view(7, src))
				O.show_message(message, m_type)

/mob/proc/emote_dead(message)
	if(client.prefs.muted & MUTE_DEADCHAT)
		to_chat(src, "<span class='warning'>You cannot send deadchat emotes (muted).</span>")
		return

	if(!(client.prefs.toggles & CHAT_DEAD))
		to_chat(src, "<span class='warning'>You have deadchat muted.</span>")
		return

	if(!src.client.holder)
		if(!config.dsay_allowed)
			to_chat(src, "<span class='warning'>Deadchat is globally muted</span>")
			return


	var/input
	if(!message)
		input = sanitize(copytext(input(src, "Choose an emote to display.") as text|null, 1, MAX_MESSAGE_LEN))
	else
		input = message

	if(input)
		message = "<span class='game deadsay'><span class='prefix'>DEAD:</span> <b>[src]</b> [message]</span>"
	else
		return


	if(message)
		for(var/mob/M in GLOB.player_list)
			if(istype(M, /mob/dead/new_player))
				continue

			if(check_rights(R_ADMIN, 0) && (M.client.prefs.chat_toggles & CHAT_DEAD)) // Show the emote to admins
				to_chat(M, message)

			else if(M.stat == DEAD && (M.client.prefs.chat_toggles & CHAT_DEAD)) // Show the emote to regular ghosts with deadchat toggled on
				M.show_message(message, 2)
