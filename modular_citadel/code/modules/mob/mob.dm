/mob/proc/use_that_empty_hand() //currently unused proc so i can implement 2-handing any item a lot easier in the future.
	return

/mob/say_mod(input, message_mode)
<<<<<<< HEAD
	var/customsayverb = findtext(input, "!", 1, 2) //KEPLER EDIT: makes starting Say with '!' output everything after it as emote, instead of the weird '*'
	if(customsayverb)
		customsayverb = lowertext(copytext(input, customsayverb+1))
		if(length(customsayverb) > 1) //make sure they actually input something
			return customsayverb
	. = ..()
=======
	var/customsayverb = findtext(input, "*")
	if(customsayverb && message_mode != MODE_WHISPER_CRIT)
		message_mode = MODE_CUSTOM_SAY
		return lowertext(copytext(input, 1, customsayverb))
	else
		return ..()
>>>>>>> 02a1aaea3... Merge pull request #9548 from Ghommie/Ghommie-cit251

/atom/movable/proc/attach_spans(input, list/spans)
	var/customsayverb = findtext(input, "!", 1, 2)
	if(customsayverb)
		return //END KEPLER EDIT
	if(input)
		return "[message_spans_start(spans)][input]</span>"
	else
		return

/mob/living/compose_message(atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, message_mode, face_name = FALSE)
	. = ..()
	if(isAI(speaker))
		return
	if(istype(speaker, /mob/living))
		var/turf/speakturf = get_turf(speaker)
		var/turf/sourceturf = get_turf(src)
		if(istype(speakturf) && istype(sourceturf) && !(speakturf in get_hear(5, sourceturf)))
			. = "<citspan class='small'>[.]</citspan>" //Don't ask how the fuck this works. It just does.
