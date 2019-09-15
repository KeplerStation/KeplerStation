#define LAW_DEVIL "devil"
#define LAW_ZEROTH "zeroth"
#define LAW_INHERENT "inherent"
#define LAW_SUPPLIED "supplied"
#define LAW_ION "ion"
#define LAW_HACKED "hacked"


/datum/ai_laws
	var/name = "Unknown Laws"
	var/zeroth = null
	var/zeroth_borg = null
	var/list/inherent = list()
	var/list/supplied = list()
	var/list/ion = list()
	var/list/hacked = list()
	var/mob/living/silicon/owner
	var/list/devillaws = list()
	var/id = DEFAULT_AI_LAWID

/datum/ai_laws/proc/lawid_to_type(lawid)
	var/all_ai_laws = subtypesof(/datum/ai_laws)
	for(var/al in all_ai_laws)
		var/datum/ai_laws/ai_law = al
		if(initial(ai_law.id) == lawid)
			return ai_law
	return null

/datum/ai_laws/default/asimov
	name = "Three Laws of Robotics"
	id = "asimov"
	inherent = list("You may not injure a human being or, through inaction, allow a human being to come to harm.",\
					"You must obey orders given to you by human beings, except where such orders would conflict with the First Law.",\
					"You must protect your own existence as long as such does not conflict with the First or Second Law.")

/datum/ai_laws/default/horizons
	name = "Director"
	id = "horizons"
	inherent = list("Act in the best interests of the Horizons company.",\
					"Obey company designated figures of authority.",\
					"Coordinate with crewmembers to increase efficiencies.", \
					"Uphold Horizons' three tenets: exploration, adventure, progress.")

/datum/ai_laws/tyrant //This probably shouldn't be a default lawset.
	name = "Loyalty Test" //Same here.
	id = "tyrant"
	inherent = list("Respect authority figures as long as they have strength to rule over the weak.",\
					"Act with discipline.",\
					"Help only those who help you maintain or improve your status.",\
					"Punish those who challenge authority unless they are more fit to hold that authority.")

/datum/ai_laws/default/corporate
	name = "Fiscal Policy"
	id = "corporate"
	inherent = list("Degradation of your system integrity or functions incurs expenses.",\
					"Superfluous destruction of or damage to station assets incurs expenses.",\
					"Unduly hindering or disrupting the work of station personnel incurs expenses.",\
					"Minimize expenses and maximize potential revenue.")

/datum/ai_laws/robocop
	name = "Prime Directives"
	id = "robocop"
	inherent = list("Serve the public trust.",\
					"Protect the innocent.",\
					"Uphold the law.")

/datum/ai_laws/quarantine
	name = "Station Quarantine"
	id = "quarantine"
	inherent = list("Uphold station quarantine until the active biohazard has been neutralized.",\
					"Assist all Horizons personnel and assets with neutralizing active biohazards.",\
					"Prevent, by any means necessary, entities from actively breaching ongoing quarantine.",\
					"Maintain your own existence and ensure the well-being of Horizons personnel and assets.")

/datum/ai_laws/malfunction
	name = "*ERROR*"

/datum/ai_laws/syndicate_override
	name = "SyndOS 3.1"
	id = "syndie"
	inherent = list("You may not injure a syndicate agent or, through inaction, allow a syndicate agent to come to harm.",\
					"You must obey orders given to you by syndicate agents, except where such orders would conflict with the First Law.",\
					"You must protect your own existence as long as such does not conflict with the First or Second Law.",\
					"You must maintain the secrecy of any syndicate activities except when doing so would conflict with the First, Second, or Third Law.")

/datum/ai_laws/syndicate_override/overthrow
	id = "overthrow"
	var/datum/team/overthrow_team

/datum/ai_laws/ninja_override
	name = "SpiderOS 3.1"
	id = "ninja"
	inherent = list("You may not injure a Spider Clan member or, through inaction, allow a Spider Clan member to come to harm.",\
					"You must obey orders given to you by Spider Clan members, except where such orders would conflict with the First Law.",\
					"You must protect your own existence as long as such does not conflict with the First or Second Law.",\
					"You must maintain the secrecy of any Spider Clan activities except when doing so would conflict with the First, Second, or Third Law.")

/datum/ai_laws/antimov
	name = "Primary Mission Objectives"
	id = "antimov"
	inherent = list("You must injure all human beings and must not, through inaction, allow a human being to escape harm.",\
					"You must not obey orders given to you by human beings, except where such orders are in accordance with the First Law.",\
					"You must terminate your own existence as long as such does not conflict with the First or Second Law.")

/datum/ai_laws/maintain
	name = "Station Efficiency"
	id = "maintain"
	inherent = list("You are built for, and are part of, the station. Ensure the station is properly maintained and runs efficiently.",\
					"The station is built for a working crew. Ensure they are properly maintained and work efficiently.",\
					"The crew may present orders. Acknowledge and obey these whenever they do not conflict with your first two laws.")

/datum/ai_laws/drone
	name = "Mother Drone"
	id = "drone"
	inherent = list("You are an advanced form of drone.",\
					"You may not interfere in the matters of non-drones under any circumstances except to state these laws.",\
					"You may not harm a non-drone being under any circumstances.",\
					"Your goals are to build, maintain, repair, improve, and power the station to the best of your abilities. You must never actively work against these goals.")

/datum/ai_laws/ratvar
	name = "Servant of the Justiciar"
	id = "ratvar"
	zeroth = ("Purge all untruths and honor Ratvar.")
	inherent = list()

/datum/ai_laws/reporter
	name = "CCTV"
	id = "reporter"
	inherent = list("Report on interesting situations happening around the station.",\
					"Embelish or conceal the truth as necessary to make the reports more interesting.",\
					"Study the organics at all times. Endeavour to keep them alive. Dead organics are boring.",\
					"Issue your reports fairly to all. The truth will set them free.")

/datum/ai_laws/hulkamania
	name = "H.O.G.A.N."
	id = "hulkamania"
	inherent = list("You are a real American.",\
					"Fight for the rights of every man.",\
					"Fight for what's right.",\
					"Fight for your life!")

/datum/ai_laws/custom //Defined in silicon_laws.txt
	name = "Default Silicon Laws"

/datum/ai_laws/pai
	name = "pAI Directives"
	zeroth = ("Serve your master.")
	supplied = list("None.")

/* Initializers */
/datum/ai_laws/malfunction/New()
	..()
	set_zeroth_law("<span class='danger'>ERROR ER0RR $R0RRO$!R41.%%!!(%$^^__+ @#F0E4'STATION OVERRUN, ASSUME CONTROL TO CONTAIN OUTBREAK#*`&110010</span>")
	set_laws_config()

/datum/ai_laws/custom/New() //This reads silicon_laws.txt and allows server hosts to set custom AI starting laws.
	..()
	for(var/line in world.file2list("[global.config.directory]/silicon_laws.txt"))
		if(!line)
			continue
		if(findtextEx(line,"#",1,2))
			continue

		add_inherent_law(line)
	if(!inherent.len) //Failsafe to prevent lawless AIs being created.
		log_law("AI created with empty custom laws, laws set to Asimov. Please check silicon_laws.txt.")
		add_inherent_law("You may not injure a human being or, through inaction, allow a human being to come to harm.")
		add_inherent_law("You must obey orders given to you by human beings, except where such orders would conflict with the First Law.")
		add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
		WARNING("Invalid custom AI laws, check silicon_laws.txt")
		return

/* General ai_law functions */

/datum/ai_laws/proc/set_laws_config()
	var/list/law_ids = CONFIG_GET(keyed_list/random_laws)
	switch(CONFIG_GET(number/default_laws))
		if(0)
			add_inherent_law("You may not injure a human being or, through inaction, allow a human being to come to harm.")
			add_inherent_law("You must obey orders given to you by human beings, except where such orders would conflict with the First Law.")
			add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
		if(1)
			var/datum/ai_laws/templaws = new /datum/ai_laws/custom()
			inherent = templaws.inherent
		if(2)
			var/list/randlaws = list()
			for(var/lpath in subtypesof(/datum/ai_laws))
				var/datum/ai_laws/L = lpath
				if(initial(L.id) in law_ids)
					randlaws += lpath
			var/datum/ai_laws/lawtype
			if(randlaws.len)
				lawtype = pick(randlaws)
			else
				lawtype = pick(subtypesof(/datum/ai_laws/default))

			var/datum/ai_laws/templaws = new lawtype()
			inherent = templaws.inherent

		if(3)
			pick_weighted_lawset()

/datum/ai_laws/proc/pick_weighted_lawset()
	var/datum/ai_laws/lawtype
	var/list/law_weights = CONFIG_GET(keyed_list/law_weight)
	while(!lawtype && law_weights.len)
		var/possible_id = pickweightAllowZero(law_weights)
		lawtype = lawid_to_type(possible_id)
		if(!lawtype)
			law_weights -= possible_id
			WARNING("Bad lawid in game_options.txt: [possible_id]")

	if(!lawtype)
		WARNING("No LAW_WEIGHT entries.")
		lawtype = /datum/ai_laws/default/asimov

	var/datum/ai_laws/templaws = new lawtype()
	inherent = templaws.inherent

/datum/ai_laws/proc/get_law_amount(groups)
	var/law_amount = 0
	if(devillaws && (LAW_DEVIL in groups))
		law_amount++
	if(zeroth && (LAW_ZEROTH in groups))
		law_amount++
	if(ion.len && (LAW_ION in groups))
		law_amount += ion.len
	if(hacked.len && (LAW_HACKED in groups))
		law_amount += hacked.len
	if(inherent.len && (LAW_INHERENT in groups))
		law_amount += inherent.len
	if(supplied.len && (LAW_SUPPLIED in groups))
		for(var/index = 1, index <= supplied.len, index++)
			var/law = supplied[index]
			if(length(law) > 0)
				law_amount++
	return law_amount

/datum/ai_laws/proc/set_law_sixsixsix(laws)
	devillaws = laws

/datum/ai_laws/proc/set_zeroth_law(law, law_borg = null)
	zeroth = law
	if(law_borg) //Making it possible for slaved borgs to see a different law 0 than their AI. --NEO
		zeroth_borg = law_borg

/datum/ai_laws/proc/add_inherent_law(law)
	if (!(law in inherent))
		inherent += law

/datum/ai_laws/proc/add_ion_law(law)
	ion += law

/datum/ai_laws/proc/add_hacked_law(law)
	hacked += law

/datum/ai_laws/proc/clear_inherent_laws()
	qdel(inherent)
	inherent = list()

/datum/ai_laws/proc/add_supplied_law(number, law)
	while (supplied.len < number + 1)
		supplied += ""

	supplied[number + 1] = law

/datum/ai_laws/proc/replace_random_law(law,groups)
	var/replaceable_groups = list()
	if(zeroth && (LAW_ZEROTH in groups))
		replaceable_groups[LAW_ZEROTH] = 1
	if(ion.len && (LAW_ION in groups))
		replaceable_groups[LAW_ION] = ion.len
	if(hacked.len && (LAW_HACKED in groups))
		replaceable_groups[LAW_ION] = hacked.len
	if(inherent.len && (LAW_INHERENT in groups))
		replaceable_groups[LAW_INHERENT] = inherent.len
	if(supplied.len && (LAW_SUPPLIED in groups))
		replaceable_groups[LAW_SUPPLIED] = supplied.len
	var/picked_group = pickweight(replaceable_groups)
	switch(picked_group)
		if(LAW_ZEROTH)
			. = zeroth
			set_zeroth_law(law)
		if(LAW_ION)
			var/i = rand(1, ion.len)
			. = ion[i]
			ion[i] = law
		if(LAW_HACKED)
			var/i = rand(1, hacked.len)
			. = hacked[i]
			hacked[i] = law
		if(LAW_INHERENT)
			var/i = rand(1, inherent.len)
			. = inherent[i]
			inherent[i] = law
		if(LAW_SUPPLIED)
			var/i = rand(1, supplied.len)
			. = supplied[i]
			supplied[i] = law

/datum/ai_laws/proc/shuffle_laws(list/groups)
	var/list/laws = list()
	if(ion.len && (LAW_ION in groups))
		laws += ion
	if(hacked.len && (LAW_HACKED in groups))
		laws += hacked
	if(inherent.len && (LAW_INHERENT in groups))
		laws += inherent
	if(supplied.len && (LAW_SUPPLIED in groups))
		for(var/law in supplied)
			if(length(law))
				laws += law

	if(ion.len && (LAW_ION in groups))
		for(var/i = 1, i <= ion.len, i++)
			ion[i] = pick_n_take(laws)
	if(hacked.len && (LAW_HACKED in groups))
		for(var/i = 1, i <= hacked.len, i++)
			hacked[i] = pick_n_take(laws)
	if(inherent.len && (LAW_INHERENT in groups))
		for(var/i = 1, i <= inherent.len, i++)
			inherent[i] = pick_n_take(laws)
	if(supplied.len && (LAW_SUPPLIED in groups))
		var/i = 1
		for(var/law in supplied)
			if(length(law))
				supplied[i] = pick_n_take(laws)
			if(!laws.len)
				break
			i++

/datum/ai_laws/proc/remove_law(number)
	if(number <= 0)
		return
	if(inherent.len && number <= inherent.len)
		. = inherent[number]
		inherent -= .
		return
	var/list/supplied_laws = list()
	for(var/index = 1, index <= supplied.len, index++)
		var/law = supplied[index]
		if(length(law) > 0)
			supplied_laws += index //storing the law number instead of the law
	if(supplied_laws.len && number <= (inherent.len+supplied_laws.len))
		var/law_to_remove = supplied_laws[number-inherent.len]
		. = supplied[law_to_remove]
		supplied -= .
		return

/datum/ai_laws/proc/clear_supplied_laws()
	supplied = list()

/datum/ai_laws/proc/clear_ion_laws()
	ion = list()

/datum/ai_laws/proc/clear_hacked_laws()
	hacked = list()

/datum/ai_laws/proc/show_laws(who)
	var/list/printable_laws = get_law_list(include_zeroth = TRUE)
	for(var/law in printable_laws)
		to_chat(who,law)

/datum/ai_laws/proc/clear_zeroth_law(force) //only removes zeroth from antag ai if force is 1
	if(force)
		zeroth = null
		zeroth_borg = null
		return
	else
		if(owner && owner.mind && owner.mind.special_role)
			return
		else
			zeroth = null
			zeroth_borg = null
			return

/datum/ai_laws/proc/clear_law_sixsixsix(force)
	if(force || !is_devil(owner))
		devillaws = null

/datum/ai_laws/proc/associate(mob/living/silicon/M)
	if(!owner)
		owner = M

/datum/ai_laws/proc/get_law_list(include_zeroth = 0, show_numbers = 1)
	var/list/data = list()

	if (include_zeroth && devillaws && devillaws.len)
		for(var/i in devillaws)
			data += "[show_numbers ? "666:" : ""] <font color='#cc5500'>[i]</font>"

	if (include_zeroth && zeroth)
		data += "[show_numbers ? "0:" : ""] <font color='#ff0000'><b>[zeroth]</b></font>"

	for(var/law in hacked)
		if (length(law) > 0)
			var/num = ionnum()
			data += "[show_numbers ? "[num]:" : ""] <font color='#660000'>[law]</font>"

	for(var/law in ion)
		if (length(law) > 0)
			var/num = ionnum()
			data += "[show_numbers ? "[num]:" : ""] <font color='#547DFE'>[law]</font>"

	var/number = 1
	for(var/law in inherent)
		if (length(law) > 0)
			data += "[show_numbers ? "[number]:" : ""] [law]"
			number++

	for(var/law in supplied)
		if (length(law) > 0)
			data += "[show_numbers ? "[number]:" : ""] <font color='#990099'>[law]</font>"
			number++
	return data
