//////////////////////////////////////////////////////
////////////////////SUBTLE COMMAND////////////////////
//////////////////////////////////////////////////////
/mob
	var/flavor_text = "" //tired of fucking double checking this
	var/flavor_text_2 = ""

/mob/proc/update_flavor_text()
	set src in usr
	if(usr != src)
		to_chat(usr, "No.")
	var/msg = stripped_multiline_input(usr, "Set the flavor text in your 'examine' verb. This can also be used for OOC notes and preferences!", "Flavor Text", html_decode(flavor_text), MAX_MESSAGE_LEN*2, TRUE)

	if(!isnull(msg))
		msg = copytext(msg, 1, MAX_MESSAGE_LEN)
		msg = html_encode(msg)

		flavor_text = msg

/mob/proc/update_flavor_text_2()
	set src in usr
	if(usr != src)
		to_chat(usr, "No.")
	var/msg = stripped_multiline_input(usr, "Set the temporary flavor text in your 'examine' verb. This should be used only for things pertaining to the current round!", "Short-Term Flavor Text", html_decode(flavor_text_2), MAX_MESSAGE_LEN*2, TRUE)

	if(!isnull(msg))
		msg = copytext(msg, 1, MAX_MESSAGE_LEN)
		msg = html_encode(msg)

		flavor_text_2 = msg


/mob/proc/warn_flavor_changed()
	if(flavor_text && flavor_text != "") // don't spam people that don't use it!
		to_chat(src, "<h2 class='alert'>OOC Warning:</h2>")
		to_chat(src, "<span class='alert'>Your flavor text is likely out of date! <a href='?src=[REF(src)];flavor_change=1'>Change</a></span>")

/mob/proc/print_flavor_text()
	if(flavor_text && flavor_text != "")
		// We are decoding and then encoding to not only get correct amount of characters, but also to prevent partial escaping characters being shown.
		var/msg = html_decode(replacetext(flavor_text, "\n", " "))
		if(length(msg) <= 40)
			return "<span class='notice'>[html_encode(msg)]</span>"
		else
			return "<span class='notice'>[html_encode(copytext(msg, 1, 37))]... <a href='?src=[REF(src)];flavor_more=1'>More...</span></a>"

/mob/proc/print_flavor_text_2()
	if(flavor_text && flavor_text != "")
		// We are decoding and then encoding to not only get correct amount of characters, but also to prevent partial escaping characters being shown.
		var/msg = html_decode(replacetext(flavor_text_2, "\n", " "))
		if(length(msg) <= 40)
			return "<span class='notice'>[html_encode(msg)]</span>"
		else
			return "<span class='notice'>[html_encode(copytext(msg, 1, 37))]... <a href='?src=[REF(src)];flavor2_more=1'>More...</span></a>"


/mob/proc/get_top_level_mob()
	if(istype(src.loc,/mob)&&src.loc!=src)
		var/mob/M=src.loc
		return M.get_top_level_mob()
	return src

proc/get_top_level_mob(var/mob/S)
	if(istype(S.loc,/mob)&&S.loc!=S)
		var/mob/M=S.loc
		return M.get_top_level_mob()
	return S
