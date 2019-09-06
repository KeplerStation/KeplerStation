/mob/dead/new_player
	var/tos_consent = FALSE

/mob/dead/new_player/proc/handle_tos_consent()
	// This is a mess of shitcode, but its my mess of shitcode. -aa
	var/accepted = FALSE // This var exists just so I can qdel the query properly
	if(!GLOB.server_tos) // Say yes if there is no TOS
		accepted = TRUE
		tos_consent = TRUE
		return TRUE

	if(!SSdbcore.IsConnected()) // Say yes if we cant load the DB
		accepted = TRUE
		tos_consent = TRUE
		return TRUE

	var/datum/DBQuery/check_consent = SSdbcore.NewQuery("SELECT * FROM [format_table_name("tos")] WHERE ckey='[src.ckey]' AND consent=1")
	if(!check_consent.warn_execute())
		accepted = TRUE // Say yes if the query failed
		tos_consent = TRUE
		return TRUE
	while(check_consent.NextRow())
		accepted = TRUE
		
	
	qdel(check_consent) // qdel after the query
	// Now we can check if this worked properly
	if(accepted == TRUE)
		tos_consent = TRUE
		return TRUE

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
