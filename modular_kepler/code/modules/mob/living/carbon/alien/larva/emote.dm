/mob/living/carbon/alien/larva/emote(act, m_type = EMOTE_VISUAL, message = null, force)
	var/param = null
	if(findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	act = lowertext(act)
	switch(act)
		if("me")
			if(silent)
				return
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

		if("custom")
			return custom_emote(m_type, message)
		if("sign")
			if(!src.restrained())
				message = text("<B>The alien</B> signs[].", (text2num(param) ? text(" the number []", text2num(param)) : null))
				m_type = EMOTE_VISUAL
		if("burp")
			message = "<B>[src]</B> burps."
			m_type = EMOTE_SOUND
		if("scratch")
			if(!src.restrained())
				message = "<B>The [src.name]</B> scratches."
				m_type = EMOTE_VISUAL
		if("whimper")
			message = "<B>The [src.name]</B> whimpers."
			m_type = EMOTE_SOUND
//		if("roar")
//			if(!muzzled)
//				message = "<B>The [src.name]</B> roars." Commenting out since larva shouldn't roar /N
//				m_type = EMOTE_SOUND
		if("tail")
			message = "<B>The [src.name]</B> waves its tail."
			m_type = EMOTE_VISUAL
		if("gasp")
			message = "<B>The [src.name]</B> gasps."
			m_type = EMOTE_SOUND
		if("shiver")
			message = "<B>The [src.name]</B> shivers."
			m_type = EMOTE_SOUND
		if("drool")
			message = "<B>The [src.name]</B> drools."
			m_type = EMOTE_VISUAL
		if("scretch")
			message = "<B>The [src.name]</B> scretches."
			m_type = EMOTE_SOUND
		if("choke")
			message = "<B>The [src.name]</B> chokes."
			m_type = EMOTE_SOUND
		if("moan")
			message = "<B>The [src.name]</B> moans!"
			m_type = EMOTE_SOUND
		if("nod")
			message = "<B>The [src.name]</B> nods its head."
			m_type = EMOTE_VISUAL
//		if("sit")
//			message = "<B>The [src.name]</B> sits down." //Larvan can't sit down, /N
//			m_type = EMOTE_VISUAL
		if("sway")
			message = "<B>The [src.name]</B> sways around dizzily."
			m_type = EMOTE_VISUAL
		if("sulk")
			message = "<B>The [src.name]</B> sulks down sadly."
			m_type = EMOTE_VISUAL
		if("twitch")
			message = "<B>The [src.name]</B> twitches violently."
			m_type = EMOTE_VISUAL
		if("dance")
			if(!src.restrained())
				message = "<B>The [src.name]</B> dances around happily."
				m_type = EMOTE_VISUAL
		if("roll")
			if(!src.restrained())
				message = "<B>The [src.name]</B> rolls."
				m_type = EMOTE_VISUAL
		if("shake")
			message = "<B>The [src.name]</B> shakes its head."
			m_type = EMOTE_VISUAL
		if("gnarl")
			message = "<B>The [src.name]</B> gnarls and shows its teeth.."
			m_type = EMOTE_SOUND
		if("jump")
			message = "<B>The [src.name]</B> jumps!"
			m_type = EMOTE_VISUAL
		if("hiss_")
			message = "<B>The [src.name]</B> hisses softly."
			m_type = EMOTE_VISUAL
		if("help")
			to_chat(src, "burp, choke, collapse, dance, drool, gasp, shiver, gnarl, jump, moan, nod, roll, scratch,\nscretch, shake, sign-#, sulk, sway, tail, twitch, whimper")
		else
			to_chat(src, text("Invalid Emote: []", act))
	if((message && src.stat == 0))
		log_emote(message, src)
		if(m_type & 1)
			for(var/mob/O in viewers(src, null))
				O.show_message(message, m_type)
				//Foreach goto(703)
		else
			for(var/mob/O in hearers(src, null))
				O.show_message(message, m_type)
				//Foreach goto(746)
	return
