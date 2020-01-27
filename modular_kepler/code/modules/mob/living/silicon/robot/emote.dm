/mob/living/silicon/robot/emote(act, m_type=1, message = null, force)
	var/param = null
	if(findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	//Emote Cooldown System (it's so simple!)
	//handle_emote_CD() located in [code\modules\mob\emote.dm]
	var/on_CD = 0
	act = lowertext(act)
	switch(act)
		//Cooldown-inducing emotes
		if("flip","flips", "chime", "chimes", "warn")
			on_CD = handle_emote_CD()			//proc located in code\modules\mob\emote.dm
		//Everything else, including typos of the above emotes
		else
			on_CD = 0	//If it doesn't induce the cooldown, we won't check for the cooldown

	if(!force && on_CD == 1)		// Check if we need to suppress the emote attempt.
		return			// Suppress emote, you're still cooling off.
	//--FalseIncarnate

	switch(act)

		if("salute","salutes")
			if(!src.buckled)
				var/M = null
				if(param)
					for(var/mob/A in view(null, null))
						if(param == A.name)
							M = A
							break
				if(!M)
					param = null

				if(param)
					message = "<B>[src]</B> salutes to [param]."
				else
					message = "<B>[src]</b> salutes."
			m_type = EMOTE_VISUAL
		if("bow","bows")
			if(!src.buckled)
				var/M = null
				if(param)
					for(var/mob/A in view(null, null))
						if(param == A.name)
							M = A
							break
				if(!M)
					param = null

				if(param)
					message = "<B>[src]</B> bows to [param]."
				else
					message = "<B>[src]</B> bows."
			m_type = EMOTE_VISUAL

		if("clap","claps")
			if(!src.restrained())
				message = "<B>[src]</B> claps."
				m_type = EMOTE_SOUND

		if("twitch")
			message = "<B>[src]</B> twitches violently."
			m_type = EMOTE_VISUAL

		if("twitch_s","twitches")
			message = "<B>[src]</B> twitches."
			m_type = EMOTE_VISUAL

		if("nod","nods")
			message = "<B>[src]</B> nods."
			m_type = EMOTE_VISUAL

		if("deathgasp")
			message = "<B>[src]</B> shudders violently for a moment, then becomes motionless, its eyes slowly darkening."
			m_type = EMOTE_VISUAL

		if("glare","glares")
			var/M = null
			if(param)
				for(var/mob/A in view(null, null))
					if(param == A.name)
						M = A
						break
			if(!M)
				param = null

			if(param)
				message = "<B>[src]</B> glares at [param]."
			else
				message = "<B>[src]</B> glares."

		if("stare","stares")
			var/M = null
			if(param)
				for(var/mob/A in view(null, null))
					if(param == A.name)
						M = A
						break
			if(!M)
				param = null

			if(param)
				message = "<B>[src]</B> stares at [param]."
			else
				message = "<B>[src]</B> stares."

		if("look","looks")
			var/M = null
			if(param)
				for(var/mob/A in view(null, null))
					if(param == A.name)
						M = A
						break

			if(!M)
				param = null

			if(param)
				message = "<B>[src]</B> looks at [param]."
			else
				message = "<B>[src]</B> looks."
			m_type = EMOTE_VISUAL

		if("flip","flips")
			m_type = EMOTE_VISUAL
			message = "<B>[src]</B> does a flip!"
			src.SpinAnimation(5,1)

		if("chime", "chimes")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> chimes[M ? " at [M]" : ""]."
			playsound(src.loc, 'sound/machines/chime.ogg', 50, 0)
			m_type = EMOTE_SOUND

		if("spin")
			message = "<B>[src]</B> spins!"
			spin(20, 1)
			if(has_buckled_mobs())
				var/datum/component/riding/riding_datum = GetComponent(/datum/component/riding)
				if(riding_datum)
					for(var/mob/M in buckled_mobs)
						riding_datum.force_dismount(M)
				else
					unbuckle_all_mobs()
			m_type = EMOTE_VISUAL

		if("warn")
			message = "<B>[src]</B> blares an alarm!"
			playsound(src.loc, 'sound/machines/warning-buzzer.ogg', 50, 0)
			m_type = EMOTE_SOUND

		if("help")
			to_chat(src, "salute, bow-(none)/mob, clap, twitch, twitches, nod, deathgasp, glare-(none)/mob, stare-(none)/mob, look, chime(s), spin, warn")

	..()

/mob/living/silicon/robot/verb/powerwarn()
	set category = "Robot Commands"
	set name = "Power Warning"

	if(stat == CONSCIOUS)
		if(!cell || !cell.charge)
			visible_message("The power warning light on <span class='name'>[src]</span> flashes urgently.",\
							"You announce you are operating in low power mode.")
			playsound(loc, 'sound/machines/buzz-two.ogg', 50, 0)
		else
			to_chat(src, "<span class='warning'>You can only use this emote when you're out of charge.</span>")
