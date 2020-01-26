/mob/living/carbon/brain/emote(act,m_type = EMOTE_VISUAL, message = null, force)
	if(!(container && istype(container, /obj/item/mmi)))//No MMI, no emotes
		return

	if(findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	if(src.stat == DEAD)
		return
	act = lowertext(act)
	switch(act)

		if("alarm")
			to_chat(src, "You sound an alarm.")
			message = "<B>\The [src]</B> sounds an alarm."
			m_type = EMOTE_SOUND
		if("alert")
			to_chat(src, "You let out a distressed noise.")
			message = "<B>\The [src]</B> lets out a distressed noise."
			m_type = EMOTE_SOUND
		if("notice")
			to_chat(src, "You play a loud tone.")
			message = "<B>\The [src]</B> plays a loud tone."
			m_type = EMOTE_SOUND
		if("flash")
			message = "The lights on <B>\the [src]</B> flash quickly."
			m_type = EMOTE_VISUAL
		if("blink")
			message = "<B>\The [src]</B> blinks."
			m_type = EMOTE_VISUAL
		if("whistle")
			to_chat(src, "You whistle.")
			message = "<B>\The [src]</B> whistles."
			m_type = EMOTE_SOUND
		if("beep")
			to_chat(src, "You beep.")
			message = "<B>\The [src]</B> beeps."
			m_type = EMOTE_SOUND
		if("boop")
			to_chat(src, "You boop.")
			message = "<B>\The [src]</B> boops."
			m_type = EMOTE_SOUND
		if("help")
			to_chat(src, "alarm, alert, notice, flash, blink, whistle, beep, boop")

	if(message && !stat)
		..()
