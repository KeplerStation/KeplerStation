SUBSYSTEM_DEF(chat_prompts)
	name = "Chat Prompts"
	flags = SS_BACKGROUND
	wait = 6000 // 6000 deciseconds, 600 seconds, 10 minutes
	var/list/prompts = list()

/datum/controller/subsystem/chat_prompts/Initialize()
	var/promptext = file2text("config/idle_announce.txt")
	prompts = text2list(promptext)
	return ..()

/datum/controller/subsystem/chat_prompts/fire()
	var/message = pick(prompts)
	to_chat(world, "<span class='notice'><b>INFO: </b></span>[message]")
