
/client/verb/force_fix_chat()
	set name = "Force Recreate Chat"
	set category = "OOC"
	var/action = alert(src, "This will force recreate your chat, completley destroying the object and remaking it.\nAre you sure? (All chat history will be lost)", "Warning", "Yes", "No")
	if(action != "Yes")
		return
	// Now we only process if Yes is pressed
	// Nuke old chat objects
	winset(src, "output", "is-visible=true;is-disabled=false")
	winset(src, "browseroutput", "is-visible=false")
	chatOutput.loaded = FALSE
	// Now make a new one
	chatOutput.start()
	chatOutput.load()
	alert(src, "Your chat has been force recreated. If this still hasnt fixed issues, please make an issue report, with your BYOND version, Windows version, and IE Version", "Done", "Ok")
