/mob/living/simple_animal/slime/emote(act, m_type = EMOTE_VISUAL, message = null, force)
	if(findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		//param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	act = lowertext(act)

	var/regenerate_icons

	switch(act) //Alphabetical please
		if("me")
			if(src.client)
				if(client.prefs.muted & MUTE_IC)
					to_chat(src, "<span class='warning'>You cannot send IC messages (muted).</span>")
					return
				if(src.client.handle_spam_prevention(message,MUTE_IC))
					return
				if(stat)
					return
				if(!(message))
					return
				return custom_emote(m_type, message)
		if("bounce")
			message = "<B>The [src.name]</B> bounces in place."
			m_type = EMOTE_VISUAL

		if("custom")
			return custom_emote(m_type, message)

		if("jiggle")
			message = "<B>The [src.name]</B> jiggles!"
			m_type = EMOTE_VISUAL

		if("light")
			message = "<B>The [src.name]</B> lights up for a bit, then stops."
			m_type = EMOTE_VISUAL

		if("moan")
			message = "<B>The [src.name]</B> moans."
			m_type = EMOTE_SOUND

		if("shiver")
			message = "<B>The [src.name]</B> shivers."
			m_type = EMOTE_SOUND

		if("sway")
			message = "<B>The [src.name]</B> sways around dizzily."
			m_type = EMOTE_VISUAL

		if("twitch")
			message = "<B>The [src.name]</B> twitches."
			m_type = EMOTE_VISUAL

		if("vibrate")
			message = "<B>The [src.name]</B> vibrates!"
			m_type = EMOTE_VISUAL

		if("noface") //mfw I have no face
			mood = null
			regenerate_icons = 1

		if("smile")
			mood = "mischevous"
			regenerate_icons = 1

		if(":3")
			mood = ":33"
			regenerate_icons = 1

		if("pout")
			mood = "pout"
			regenerate_icons = 1

		if("frown")
			mood = "sad"
			regenerate_icons = 1

		if("scowl")
			mood = "angry"
			regenerate_icons = 1

		if("help") //This is an exception
			to_chat(src, "Help for slime emotes. You can use these emotes with say \"*emote\":\n\nbounce, custom, jiggle, light, moan, shiver, sway, twitch, vibrate.")

		else
			to_chat(src, "<span class='notice'>Unusable emote '[act]'. Say *help for a list.</span>")
	if((message && stat == CONSCIOUS))
		if(client)
			log_emote("[name]/[key] : [message]", src)
		if(m_type & 1)
			visible_message(message)
		else
			loc.audible_message(message)

	if(regenerate_icons)
		regenerate_icons()

	return
