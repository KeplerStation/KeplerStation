/datum/status_effect/chem/SGDF
	id = "SGDF"
	var/mob/living/fermi_Clone
	var/mob/living/original
	var/datum/mind/originalmind
	var/status_set = FALSE
	alert_type = null

/datum/status_effect/chem/SGDF/on_apply()
	log_game("FERMICHEM: SGDF status appied on [owner], ID: [owner.key]")
	fermi_Clone = owner
	return ..()

/datum/status_effect/chem/SGDF/tick()
	if(!status_set)
		return ..()
	if(original.stat == DEAD || original == null || !original)
		if((fermi_Clone && fermi_Clone.stat != DEAD) || (fermi_Clone == null))
			if(originalmind)
				owner.remove_status_effect(src)
	..()

/datum/status_effect/chem/SGDF/on_remove(mob/living/carbon/M)
	log_game("FERMICHEM: SGDF mind shift applied. [owner] is now playing as their clone and should not have memories after their clone split (look up SGDF status applied). ID: [owner.key]")
	originalmind.transfer_to(fermi_Clone)
	to_chat(owner, "<span class='warning'>Lucidity shoots to your previously blank mind as your mind suddenly finishes the cloning process. You marvel for a moment at yourself, as your mind subconciously recollects all your memories up until the point when you cloned yourself. curiously, you find that you memories are blank after you ingested the sythetic serum, leaving you to wonder where the other you is.</span>")
	to_chat(M, "<span class='warning'>Lucidity shoots to your previously blank mind as your mind suddenly finishes the cloning process. You marvel for a moment at yourself, as your mind subconciously recollects all your memories up until the point when you cloned yourself. curiously, you find that you memories are blank after you ingested the sythetic serum, leaving you to wonder where the other you is.</span>")
	fermi_Clone = null

