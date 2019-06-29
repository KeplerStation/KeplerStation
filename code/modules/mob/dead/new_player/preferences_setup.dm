
	//The mob should have a gender you want before running this proc. Will run fine without H
/datum/preferences/proc/random_character(gender_override)
	if(gender_override)
		gender = gender_override
	else
		gender = pick(MALE,FEMALE)
	underwear = random_underwear(gender)
	undershirt = random_undershirt(gender)
	socks = random_socks()
	skin_tone = random_skin_tone()
	hair_style = random_hair_style(gender)
	facial_hair_style = random_facial_hair_style(gender)
	hair_color = random_short_color()
	facial_hair_color = hair_color
	eye_color = random_eye_color()
	if(!pref_species)
		var/rando_race = pick(GLOB.roundstart_races)
		pref_species = new rando_race()
	features = random_features()		
	// Snowflake code is easier than removing half the stuff						
	if(pref_species.id == "lizard")
		features["tail_lizard"] = "Axolotl"
		features["body_markings"] = "None"
						
	if(pref_species.id == "felinid")
		features["mam_tail"] = "Cat"
		features["mam_ears"] = "Cat"
						
	if(pref_species.id in list("slimeperson", "human", "ipc", "plasmaman")) // Nuke snowflake shit
		features["mam_tail"] = "None"
		features["mam_ears"] = "None"
		features["tail_lizard"] = "None"
		features["mam_body_markings"] = "None"
		features["body_markings"] = "None"
		features["mam_snouts"] = "None"
		features["snout"] = "None"
		features["ears"] = "None"
		features["horns"] = "None"

	features["legs"] = "Normal Legs" // Digitrade sucks to sprite for, fight me
	age = rand(AGE_MIN,AGE_MAX)

/datum/preferences/proc/update_preview_icon()
	// Silicons only need a very basic preview since there is no customization for them.
	if(job_engsec_high)
		switch(job_engsec_high)
			if(AI_JF)
				parent.show_character_previews(image('icons/mob/ai.dmi', resolve_ai_icon(preferred_ai_core_display), dir = SOUTH))
				return
			if(CYBORG)
				parent.show_character_previews(image('icons/mob/robots.dmi', icon_state = "robot", dir = SOUTH))
				return

	// Set up the dummy for its photoshoot
	var/mob/living/carbon/human/dummy/mannequin = generate_or_wait_for_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)
	mannequin.cut_overlays()
	mannequin.add_overlay(mutable_appearance('modular_citadel/icons/ui/backgrounds.dmi', bgstate, layer = SPACE_LAYER))
	copy_to(mannequin)

	// Determine what job is marked as 'High' priority, and dress them up as such.
	var/datum/job/previewJob
	var/highRankFlag = job_civilian_high | job_medsci_high | job_engsec_high

	if(job_civilian_low & ASSISTANT)
		previewJob = SSjob.GetJob("Assistant")
	else if(highRankFlag)
		var/highDeptFlag
		if(job_civilian_high)
			highDeptFlag = CIVILIAN
		else if(job_medsci_high)
			highDeptFlag = MEDSCI
		else if(job_engsec_high)
			highDeptFlag = ENGSEC

		for(var/datum/job/job in SSjob.occupations)
			if(job.flag == highRankFlag && job.department_flag == highDeptFlag)
				previewJob = job
				break

	if(previewJob)
		if(current_tab != 2)
			mannequin.job = previewJob.title
			previewJob.equip(mannequin, TRUE)

	COMPILE_OVERLAYS(mannequin)
	parent.show_character_previews(new /mutable_appearance(mannequin))
	unset_busy_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)
