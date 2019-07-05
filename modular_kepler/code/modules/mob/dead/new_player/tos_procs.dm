/mob/dead/new_player
	var/tos_consent = FALSE

/mob/dead/new_player/proc/handle_tos_consent()
	if(!GLOB.server_tos) // Say yes if there is no TOS
		return TRUE

	if(!SSdbcore.IsConnected()) // Say yes if we cant load the DB
		tos_consent = TRUE
		return TRUE

	var/datum/DBQuery/check_consent = SSdbcore.NewQuery("SELECT * FROM [format_table_name("tos")] WHERE ckey='[src.ckey]' AND consent=1")
	if(!check_consent.warn_execute())
		qdel(check_consent)
		return TRUE // Say yes if the query failed
	while(check_consent.NextRow())
		tos_consent = TRUE
		qdel(check_consent)
		return TRUE // Say yes if they have accepted

	tos_consent() // If we got here it means they dont accept
	return FALSE

/mob/dead/new_player/proc/tos_consent()
	src << browse(null, "window=playersetup")
	var/output = GLOB.server_tos
	output += "<p><a href='byond://?src=[REF(src)];consent_signed=SIGNED'>I consent</A>"
	output += "<p><a href='byond://?src=[REF(src)];consent_rejected=NOTSIGNED'>I DO NOT consent</A>"
	src << browse(output,"window=privacy_consent;size=500x300")
	var/datum/browser/popup = new(src, "privacy_consent", "<div align='center'>Server TOS</div>", 500, 400)
	popup.set_window_options("can_close=0")
	popup.set_content(output)
	popup.open(0)
	return
