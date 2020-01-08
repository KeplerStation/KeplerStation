SUBSYSTEM_DEF(vote)
	name = "Vote"
	wait = 10

	flags = SS_KEEP_TIMING|SS_NO_INIT

	runlevels = RUNLEVEL_LOBBY | RUNLEVELS_DEFAULT

	var/initiator = null
	var/started_time = null
	var/time_remaining = 0
	var/mode = null
	var/question = null
	var/list/choices = list()
<<<<<<< HEAD
=======
	var/list/scores = list()
	var/list/choice_descs = list() // optional descriptions
>>>>>>> 652cf6e60c... Merge pull request #10440 from Putnam3145/weird-secret
	var/list/voted = list()
	var/list/voting = list()
	var/list/generated_actions = list()

	var/obfuscated = FALSE//CIT CHANGE - adds obfuscated/admin-only votes

	var/list/stored_gamemode_votes = list() //Basically the last voted gamemode is stored here for end-of-round use.

	var/list/stored_modetier_results = list() // The aggregated tier list of the modes available in secret.

/datum/controller/subsystem/vote/fire()	//called by master_controller
	if(mode)
		time_remaining = round((started_time + CONFIG_GET(number/vote_period) - world.time)/10)

		if(time_remaining < 0)
			result()
			for(var/client/C in voting)
				C << browse(null, "window=vote;can_close=0")
<<<<<<< HEAD
			reset()
		else
=======
			if(end_time < world.time) // result() can change this
				reset()
		else if(next_pop < world.time)
>>>>>>> 652cf6e60c... Merge pull request #10440 from Putnam3145/weird-secret
			var/datum/browser/client_popup
			for(var/client/C in voting)
				client_popup = new(C, "vote", "Voting Panel")
				client_popup.set_window_options("can_close=0")
				client_popup.set_content(interface(C))
				client_popup.open(0)


/datum/controller/subsystem/vote/proc/reset()
	initiator = null
	time_remaining = 0
	mode = null
	question = null
	choices.Cut()
	voted.Cut()
	voting.Cut()
	scores.Cut()
	obfuscated = FALSE //CIT CHANGE - obfuscated votes
	remove_action_buttons()

/datum/controller/subsystem/vote/proc/get_result()
	//get the highest number of votes
	var/greatest_votes = 0
	var/total_votes = 0
	for(var/option in choices)
		var/votes = choices[option]
		total_votes += votes
		if(votes > greatest_votes)
			greatest_votes = votes
	//default-vote for everyone who didn't vote
	if(!CONFIG_GET(flag/default_no_vote) && choices.len)
		var/list/non_voters = GLOB.directory.Copy()
		non_voters -= voted
		for (var/non_voter_ckey in non_voters)
			var/client/C = non_voters[non_voter_ckey]
			if (!C || C.is_afk())
				non_voters -= non_voter_ckey
		if(non_voters.len > 0)
			if(mode == "restart")
				choices["Continue Playing"] += non_voters.len
				if(choices["Continue Playing"] >= greatest_votes)
					greatest_votes = choices["Continue Playing"]
			else if(mode == "gamemode")
				if(GLOB.master_mode in choices)
					choices[GLOB.master_mode] += non_voters.len
					if(choices[GLOB.master_mode] >= greatest_votes)
						greatest_votes = choices[GLOB.master_mode]
	//get all options with that many votes and return them in a list
	. = list()
	if(greatest_votes)
		for(var/option in choices)
			if(choices[option] == greatest_votes)
				. += option
	return .

<<<<<<< HEAD
=======
/datum/controller/subsystem/vote/proc/calculate_condorcet_votes(var/blackbox_text)
	// https://en.wikipedia.org/wiki/Schulze_method#Implementation
	var/list/d[][] = new/list(choices.len,choices.len) // the basic vote matrix, how many times a beats b
	for(var/ckey in voted)
		var/list/this_vote = voted[ckey]
		for(var/a in 1 to choices.len)
			for(var/b in a+1 to choices.len)
				var/a_rank = this_vote.Find(a)
				var/b_rank = this_vote.Find(b)
				a_rank = a_rank ? a_rank : choices.len+1
				b_rank = b_rank ? b_rank : choices.len+1
				if(a_rank<b_rank)
					d[a][b]++
				else if(b_rank<a_rank)
					d[b][a]++
				//if equal, do nothing
	var/list/p[][] = new/list(choices.len,choices.len) //matrix of shortest path from a to b
	for(var/i in 1 to choices.len)
		for(var/j in 1 to choices.len)
			if(i != j)
				var/pref_number = d[i][j]
				var/opposite_pref = d[j][i]
				if(pref_number>opposite_pref)
					p[i][j] = d[i][j]
				else
					p[i][j] = 0
	for(var/i in 1 to choices.len)
		for(var/j in 1 to choices.len)
			if(i != j)
				for(var/k in 1 to choices.len) // YEAH O(n^3) !!
					if(i != k && j != k)
						p[j][k] = max(p[j][k],min(p[j][i], p[i][k]))
	//one last pass, now that we've done the math
	for(var/i in 1 to choices.len)
		for(var/j in 1 to choices.len)
			if(i != j)
				SSblackbox.record_feedback("nested tally","voting",p[i][j],list(blackbox_text,"Shortest Paths",choices[i],choices[j]))
				if(p[i][j] >= p[j][i])
					choices[choices[i]]++ // higher shortest path = better candidate, so we add to choices here
					// choices[choices[i]] is the schulze ranking, here, rather than raw vote numbers

/datum/controller/subsystem/vote/proc/calculate_majority_judgement_vote(var/blackbox_text)
	// https://en.wikipedia.org/wiki/Majority_judgment
	var/list/scores_by_choice = list()
	for(var/choice in choices)
		scores_by_choice[choice] = list()
	for(var/ckey in voted)
		var/list/this_vote = voted[ckey]
		var/list/pretty_vote = list()
		for(var/choice in this_vote)
			sorted_insert(scores_by_choice[choice],this_vote[choice],/proc/cmp_numeric_asc)
			// START BALLOT GATHERING
			pretty_vote += choice
			pretty_vote[choice] = GLOB.vote_score_options[this_vote[choice]]
		SSblackbox.record_feedback("associative","voting_ballots",1,pretty_vote)
		// END BALLOT GATHERING
	for(var/score_name in scores_by_choice)
		var/list/score = scores_by_choice[score_name]
		for(var/indiv_score in score)
			SSblackbox.record_feedback("nested tally","voting",1,list(blackbox_text,"Scores",score_name,GLOB.vote_score_options[indiv_score])) 
		if(score.len == 0)
			scores_by_choice -= score_name
	while(scores_by_choice.len > 1)
		var/highest_median = 0
		for(var/score_name in scores_by_choice) // first get highest median
			var/list/score = scores_by_choice[score_name]
			if(!score.len)
				scores_by_choice -= score_name
				continue
			var/median = score[max(1,round(score.len/2))]
			if(median >= highest_median)
				highest_median = median
		for(var/score_name in scores_by_choice) // then, remove
			var/list/score = scores_by_choice[score_name]
			var/median = score[max(1,round(score.len/2))]
			if(median < highest_median)
				scores_by_choice -= score_name
		for(var/score_name in scores_by_choice) // after removals
			var/list/score = scores_by_choice[score_name]
			if(score.len == 0)
				choices[score_name] += 100 // we're in a tie situation--just go with the first one
				return
			var/median_pos = max(1,round(score.len/2))
			score.Cut(median_pos,median_pos+1)
			choices[score_name]++

/datum/controller/subsystem/vote/proc/calculate_scores(var/blackbox_text)
	var/list/scores_by_choice = list()
	for(var/choice in choices)
		scores_by_choice[choice] = list()
	for(var/ckey in voted)
		var/list/this_vote = voted[ckey]
		for(var/choice in this_vote)
			sorted_insert(scores_by_choice[choice],this_vote[choice],/proc/cmp_numeric_asc)
	var/middle_score = round(GLOB.vote_score_options.len/2,1)
	for(var/score_name in scores_by_choice)
		var/list/score = scores_by_choice[score_name]
		for(var/S in score)
			scores[score_name] += S-middle_score
		SSblackbox.record_feedback("nested tally","voting",scores[score_name],list(blackbox_text,"Total scores",score_name))


>>>>>>> 652cf6e60c... Merge pull request #10440 from Putnam3145/weird-secret
/datum/controller/subsystem/vote/proc/announce_result()
	var/list/winners = get_result()
	var/text
	var/was_roundtype_vote = mode == "roundtype" || mode == "dynamic"
	if(winners.len > 0)
		if(question)
			text += "<b>[question]</b>"
		else
			text += "<b>[capitalize(mode)] Vote</b>"
		if(was_roundtype_vote)
			stored_gamemode_votes = list()
		for(var/i=1,i<=choices.len,i++)
			var/votes = choices[choices[i]]
			if(!votes)
				votes = 0
			if(was_roundtype_vote)
				stored_gamemode_votes[choices[i]] = votes
			text += "\n<b>[choices[i]]:</b> [obfuscated ? "???" : votes]" //CIT CHANGE - adds obfuscated votes
		if(mode != "custom")
			if(winners.len > 1 && !obfuscated) //CIT CHANGE - adds obfuscated votes
				text = "\n<b>Vote Tied Between:</b>"
				for(var/option in winners)
					text += "\n\t[option]"
			. = pick(winners)
			text += "\n<b>Vote Result: [obfuscated ? "???" : .]</b>" //CIT CHANGE - adds obfuscated votes
		else
			text += "\n<b>Did not vote:</b> [GLOB.clients.len-voted.len]"
	else
		text += "<b>Vote Result: Inconclusive - No Votes!</b>"
	log_vote(text)
	remove_action_buttons()
	to_chat(world, "\n<font color='purple'>[text]</font>")
	if(obfuscated) //CIT CHANGE - adds obfuscated votes. this messages admins with the vote's true results
		var/admintext = "Obfuscated results"
<<<<<<< HEAD
=======
		if(vote_system == RANKED_CHOICE_VOTING)
			admintext += "\nIt should be noted that this is not a raw tally of votes (impossible in ranked choice) but the score determined by the schulze method of voting, so the numbers will look weird!"
		else if(vote_system == SCORE_VOTING)
			admintext += "\nIt should be noted that this is not a raw tally of votes but the number of runoffs done by majority judgement!"
>>>>>>> 652cf6e60c... Merge pull request #10440 from Putnam3145/weird-secret
		for(var/i=1,i<=choices.len,i++)
			var/votes = choices[choices[i]]
			admintext += "\n<b>[choices[i]]:</b> [votes]"
		message_admins(admintext)
	return .

#define PEACE "calm"
#define CHAOS "chaotic"

/datum/controller/subsystem/vote/proc/result()
	. = announce_result()
	var/restart = 0
	if(.)
		switch(mode)
			if("roundtype") //CIT CHANGE - adds the roundstart extended/secret vote
				if(SSticker.current_state > GAME_STATE_PREGAME)//Don't change the mode if the round already started.
					return message_admins("A vote has tried to change the gamemode, but the game has already started. Aborting.")
				GLOB.master_mode = .
				SSticker.save_mode(.)
				message_admins("The gamemode has been voted for, and has been changed to: [GLOB.master_mode]")
				log_admin("Gamemode has been voted for and switched to: [GLOB.master_mode].")
				if(CONFIG_GET(flag/modetier_voting))
					reset()
					started_time = 0
					initiate_vote("mode tiers","server",hideresults=FALSE,votesystem=RANKED_CHOICE_VOTING,forced=TRUE, vote_time = 30 MINUTES)
					to_chat(world,"<b>The vote will end right as the round starts.</b>")
					return .
			if("restart")
				if(. == "Restart Round")
					restart = 1
			if("gamemode")
				if(GLOB.master_mode != .)
					SSticker.save_mode(.)
					if(SSticker.HasRoundStarted())
						restart = 1
					else
						GLOB.master_mode = .
			if("mode tiers")
				stored_modetier_results = choices.Copy()
			if("dynamic")
				if(SSticker.current_state > GAME_STATE_PREGAME)//Don't change the mode if the round already started.
					return message_admins("A vote has tried to change the gamemode, but the game has already started. Aborting.")
				GLOB.master_mode = "dynamic"
				if("extended" in choices)
					if(. == "extended")
						GLOB.dynamic_forced_extended = TRUE // we still do the rest of the stuff
					choices[PEACE] += choices["extended"]
				var/mean = 0
				var/voters = 0
				for(var/client/c in GLOB.clients)
					var/vote = c.prefs.preferred_chaos
					if(vote)
						voters += 1
						switch(vote)
							if(CHAOS_NONE)
								mean -= 0.1
							if(CHAOS_LOW)
								mean -= 0.05
							if(CHAOS_HIGH)
								mean += 0.05
							if(CHAOS_MAX)
								mean += 0.1
				mean/=voters
				if(voted.len != 0)
					mean += (choices[PEACE]*-1+choices[CHAOS])/voted.len
				GLOB.dynamic_curve_centre = mean*20
				GLOB.dynamic_curve_width = CLAMP(2-abs(mean*5),0.5,4)
				to_chat(world,"<span class='boldannounce'>Dynamic curve centre set to [GLOB.dynamic_curve_centre] and width set to [GLOB.dynamic_curve_width].</span>")
				log_admin("Dynamic curve centre set to [GLOB.dynamic_curve_centre] and width set to [GLOB.dynamic_curve_width]")
			if("map")
				var/datum/map_config/VM = config.maplist[.]
				message_admins("The map has been voted for and will change to: [VM.map_name]")
				log_admin("The map has been voted for and will change to: [VM.map_name]")
				if(SSmapping.changemap(config.maplist[.]))
					to_chat(world, "<span class='boldannounce'>The map vote has chosen [VM.map_name] for next round!</span>")
	if(restart)
		var/active_admins = 0
		for(var/client/C in GLOB.admins)
			if(!C.is_afk() && check_rights_for(C, R_SERVER))
				active_admins = 1
				break
		if(!active_admins)
			SSticker.Reboot("Restart vote successful.", "restart vote")
		else
			to_chat(world, "<span style='boldannounce'>Notice:Restart vote will not restart the server automatically because there are active admins on.</span>")
			message_admins("A restart vote has passed, but there are active admins on with +server, so it has been canceled. If you wish, you may restart the server.")

	return .

/datum/controller/subsystem/vote/proc/submit_vote(vote)
	if(mode)
		if(CONFIG_GET(flag/no_dead_vote) && usr.stat == DEAD && !usr.client.holder)
			return 0
		if(!(usr.ckey in voted))
			if(vote && 1<=vote && vote<=choices.len)
				voted += usr.ckey
				voted[usr.ckey] = vote
				choices[choices[vote]]++	//check this
				return vote
		else if(vote && 1<=vote && vote<=choices.len)
			choices[choices[voted[usr.ckey]]]--
			voted[usr.ckey] = vote
			choices[choices[vote]]++
			return vote
	return 0

/datum/controller/subsystem/vote/proc/initiate_vote(vote_type, initiator_key, hideresults)//CIT CHANGE - adds hideresults argument to votes to allow for obfuscated votes
	if(!mode)
		if(started_time)
			var/next_allowed_time = (started_time + CONFIG_GET(number/vote_delay))
			if(mode)
				to_chat(usr, "<span class='warning'>There is already a vote in progress! please wait for it to finish.</span>")
				return 0

			var/admin = FALSE
			var/ckey = ckey(initiator_key)
			if(GLOB.admin_datums[ckey])
				admin = TRUE

			if(next_allowed_time > world.time && !admin)
				to_chat(usr, "<span class='warning'>A vote was initiated recently, you must wait [DisplayTimeText(next_allowed_time-world.time)] before a new vote can be started!</span>")
				return 0

		reset()
		obfuscated = hideresults //CIT CHANGE - adds obfuscated votes
		switch(vote_type)
			if("restart")
				choices.Add("Restart Round","Continue Playing")
			if("gamemode")
				choices.Add(config.votable_modes)
			if("map")
				var/players = GLOB.clients.len
				var/list/lastmaps = SSpersistence.saved_maps?.len ? list("[SSmapping.config.map_name]") | SSpersistence.saved_maps : list("[SSmapping.config.map_name]")
				for(var/M in config.maplist) //This is a typeless loop due to the finnicky nature of keyed lists in this kind of context
					var/datum/map_config/targetmap = config.maplist[M]
					if(!istype(targetmap))
						continue
					if(!targetmap.voteweight)
						continue
					if((targetmap.config_min_users && players < targetmap.config_min_users) || (targetmap.config_max_users && players > targetmap.config_max_users))
						continue
					if(targetmap.max_round_search_span && count_occurences_of_value(lastmaps, M, targetmap.max_round_search_span) >= targetmap.max_rounds_played)
						continue
					choices |= M
			if("roundtype") //CIT CHANGE - adds the roundstart secret/extended vote
				choices.Add("secret", "extended")
			if("mode tiers")
				var/list/modes_to_add = config.votable_modes
				var/list/probabilities = CONFIG_GET(keyed_list/probability)
				for(var/tag in modes_to_add)
					if(probabilities[tag] <= 0)
						modes_to_add -= tag
				choices.Add(modes_to_add)
			if("dynamic")
				var/saved_threats = SSpersistence.saved_threat_levels
				if((saved_threats[1]+saved_threats[2]+saved_threats[3])>150)
					choices.Add("extended",PEACE,CHAOS)
				else
					choices.Add(PEACE,CHAOS)
			if("custom")
				question = stripped_input(usr,"What is the vote for?")
				if(!question)
					return 0
				for(var/i=1,i<=10,i++)
					var/option = capitalize(stripped_input(usr,"Please enter an option or hit cancel to finish"))
					if(!option || mode || !usr.client)
						break
					choices.Add(option)
			else
				return 0
		mode = vote_type
		initiator = initiator_key
		started_time = world.time
		var/text = "[capitalize(mode)] vote started by [initiator]."
		if(mode == "custom")
			text += "\n[question]"
		log_vote(text)
		var/vp = CONFIG_GET(number/vote_period)
		to_chat(world, "\n<font color='purple'><b>[text]</b>\nType <b>vote</b> or click <a href='?src=[REF(src)]'>here</a> to place your votes.\nYou have [DisplayTimeText(vp)] to vote.</font>")
		time_remaining = round(vp/10)
		for(var/c in GLOB.clients)
			SEND_SOUND(c, sound('sound/misc/server-ready.ogg'))
			var/client/C = c
			var/datum/action/vote/V = new
			if(question)
				V.name = "Vote: [question]"
			C.player_details.player_actions += V
			V.Grant(C.mob)
			generated_actions += V
		return 1
	return 0

/datum/controller/subsystem/vote/proc/interface(client/C)
	if(!C)
		return
	var/admin = 0
	var/trialmin = 0
	if(C.holder)
		admin = 1
		if(check_rights_for(C, R_ADMIN))
			trialmin = 1
	voting |= C

	if(mode)
		if(question)
			. += "<h2>Vote: '[question]'</h2>"
		else
			. += "<h2>Vote: [capitalize(mode)]</h2>"
		. += "Time Left: [time_remaining] s<hr><ul>"
		for(var/i=1,i<=choices.len,i++)
			var/votes = choices[choices[i]]
			var/ivotedforthis = ((C.ckey in voted) && (voted[C.ckey] == i) ? TRUE : FALSE)
			if(!votes)
				votes = 0
			. += "<li>[ivotedforthis ? "<b>" : ""]<a href='?src=[REF(src)];vote=[i]'>[choices[i]]</a> ([obfuscated ? (admin ? "??? ([votes])" : "???") : votes] votes)[ivotedforthis ? "</b>" : ""]</li>" // CIT CHANGE - adds obfuscated votes
		. += "</ul><hr>"
		if(admin)
			. += "(<a href='?src=[REF(src)];vote=cancel'>Cancel Vote</a>) "
	else
		. += "<h2>Start a vote:</h2><hr><ul><li>"
		//restart
		var/avr = CONFIG_GET(flag/allow_vote_restart)
		if(trialmin || avr)
			. += "<a href='?src=[REF(src)];vote=restart'>Restart</a>"
		else
			. += "<font color='grey'>Restart (Disallowed)</font>"
		if(trialmin)
			. += "\t(<a href='?src=[REF(src)];vote=toggle_restart'>[avr ? "Allowed" : "Disallowed"]</a>)"
		. += "</li><li>"
		//gamemode
		var/avm = CONFIG_GET(flag/allow_vote_mode)
		if(trialmin || avm)
			. += "<a href='?src=[REF(src)];vote=gamemode'>GameMode</a>"
		else
			. += "<font color='grey'>GameMode (Disallowed)</font>"
		if(trialmin)
			. += "\t(<a href='?src=[REF(src)];vote=toggle_gamemode'>[avm ? "Allowed" : "Disallowed"]</a>)"

		. += "</li>"
		//custom
		if(trialmin)
			. += "<li><a href='?src=[REF(src)];vote=custom'>Custom</a></li>"
		. += "</ul><hr>"
	. += "<a href='?src=[REF(src)];vote=close' style='position:absolute;right:50px'>Close</a>"
	return .


/datum/controller/subsystem/vote/Topic(href,href_list[],hsrc)
	if(!usr || !usr.client)
		return	//not necessary but meh...just in-case somebody does something stupid
	switch(href_list["vote"])
		if("close")
			voting -= usr.client
			usr << browse(null, "window=vote")
			return
		if("cancel")
			if(usr.client.holder)
				reset()
		if("toggle_restart")
			if(usr.client.holder)
				CONFIG_SET(flag/allow_vote_restart, !CONFIG_GET(flag/allow_vote_restart))
		if("toggle_gamemode")
			if(usr.client.holder)
				CONFIG_SET(flag/allow_vote_mode, !CONFIG_GET(flag/allow_vote_mode))
		if("restart")
			if(CONFIG_GET(flag/allow_vote_restart) || usr.client.holder)
				initiate_vote("restart",usr.key)
		if("gamemode")
			if(CONFIG_GET(flag/allow_vote_mode) || usr.client.holder)
				initiate_vote("gamemode",usr.key)
		if("custom")
			if(usr.client.holder)
				initiate_vote("custom",usr.key)
		else
			submit_vote(round(text2num(href_list["vote"])))
	usr.vote()

/datum/controller/subsystem/vote/proc/remove_action_buttons()
	for(var/v in generated_actions)
		var/datum/action/vote/V = v
		if(!QDELETED(V))
			V.remove_from_client()
			V.Remove(V.owner)
	generated_actions = list()

/mob/verb/vote()
	set category = "OOC"
	set name = "Vote"

	var/datum/browser/popup = new(src, "vote", "Voting Panel")
	popup.set_window_options("can_close=0")
	popup.set_content(SSvote.interface(client))
	popup.open(0)

/datum/action/vote
	name = "Vote!"
	button_icon_state = "vote"

/datum/action/vote/Trigger()
	if(owner)
		owner.vote()
		remove_from_client()
		Remove(owner)

/datum/action/vote/IsAvailable()
	return 1

/datum/action/vote/proc/remove_from_client()
	if(!owner)
		return
	if(owner.client)
		owner.client.player_details.player_actions -= src
	else if(owner.ckey)
		var/datum/player_details/P = GLOB.player_details[owner.ckey]
		if(P)
			P.player_actions -= src

#undef PEACE
#undef CHAOS
