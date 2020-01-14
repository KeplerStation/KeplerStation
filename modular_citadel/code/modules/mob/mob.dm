/mob/proc/use_that_empty_hand() //currently unused proc so i can implement 2-handing any item a lot easier in the future.
	return

/mob/say_mod(input, message_mode)
	var/customsayverb = findtext(input, "!", 1, 2) //KEPLER EDIT: makes starting Say with '!' output everything after it as emote, instead of the weird '*'
	if(customsayverb)
		customsayverb = lowertext(copytext(input, customsayverb+1))
		if(length(customsayverb) > 1) //make sure they actually input something
			return customsayverb
	. = ..()

/atom/movable/proc/attach_spans(input, list/spans)
	var/customsayverb = findtext(input, "!", 1, 2)
	if(customsayverb)
		return //END KEPLER EDIT
	if(input)
		return "[message_spans_start(spans)][input]</span>"
	else
		return

/mob/living/compose_message(atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, message_mode, face_name = FALSE, atom/movable/source)
	. = ..()
	if(isliving(speaker))
		var/turf/sourceturf = get_turf(source)
		var/turf/T = get_turf(src)
		if(sourceturf && T && !(sourceturf in get_hear(5, T)))
			. = "<span class='small'>[.]</span>"
