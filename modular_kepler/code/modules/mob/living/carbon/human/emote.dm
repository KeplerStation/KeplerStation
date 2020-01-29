/mob/living/carbon/human/emote(act, m_type = EMOTE_VISUAL, message = null, force)

	if(stat == DEAD)
		return // No screaming bodies

	var/param = null
	if(findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	var/miming = FALSE
	if(mind)
		miming = mind.miming

	//Emote Cooldown System (it's so simple!)
	//handle_emote_CD() located in [code\modules\mob\emote.dm]
	var/on_CD = FALSE
	act = lowertext(act)
	switch(act)
		//Cooldown-inducing emotes

// FOR WHEN MACHINE PEOPLE GETS IN
//		if("ping", "pings", "buzz", "buzzes", "beep", "beeps", "yes", "no", "buzz2")
//			var/found_machine_head = FALSE
//			is
//			if(ismachine(src))		//Only Machines can beep, ping, and buzz, yes, no, and make a silly sad trombone noise.
//				on_CD = handle_emote_CD()			//proc located in code\modules\mob\emote.dm
//				found_machine_head = TRUE
//			else
//				var/obj/item/organ/external/head/H = get_organ("head") // If you have a robotic head, you can make beep-boop noises
//				if(H && H.is_robotic())
//					on_CD = handle_emote_CD()
//					found_machine_head = TRUE
//
//			if(!found_machine_head)								//Everyone else fails, skip the emote attempt
//				return								//Everyone else fails, skip the emote attempt

		if("msqueak")
			if(ismoth(src))
				on_CD = handle_emote_CD()
			else
				return ..()
		
		if("squish", "squishes")
			if(isjellyperson(src))	//Only Jelly People can squish
				on_CD = handle_emote_CD()			//proc located in code\modules\mob\emote.dm'
			else
				return ..()

		if("scream", "screams")
			on_CD = handle_emote_CD(50) //longer cooldown
		if("fart", "farts", "flip", "flips", "snap", "snaps")
			on_CD = handle_emote_CD()				//proc located in code\modules\mob\emote.dm
		if("cough", "coughs", "slap", "slaps")
			on_CD = handle_emote_CD()
		if("sneeze", "sneezes")
			on_CD = handle_emote_CD()
		if("clap", "claps")
			on_CD = handle_emote_CD()
		//Everything else, including typos of the above emotes
		else
			on_CD = FALSE	//If it doesn't induce the cooldown, we won't check for the cooldown

	if(!force && on_CD == 1)		// Check if we need to suppress the emote attempt.
		return			// Suppress emote, you're still cooling off.

	switch(act)
		if("me")									//OKAY SO RANT TIME, THIS FUCKING HAS TO BE HERE OR A SHITLOAD OF THINGS BREAK
			return custom_emote(m_type, message)	//DO YOU KNOW WHY SHIT BREAKS? BECAUSE SO MUCH OLDCODE CALLS mob.emote("me",1,"whatever_the_fuck_it_wants_to_emote")
													//WHO THE FUCK THOUGHT THAT WAS A GOOD FUCKING IDEA!?!?

//		if("ping", "pings")
//			var/M = handle_emote_param(param)
//
//			message = "<B>[src]</B> pings[M ? " at [M]" : ""]."
//			playsound(loc, 'sound/machines/ping.ogg', 50, 0)
//			m_type = EMOTE_SOUND
//
//		if("buzz2")
//			var/M = handle_emote_param(param)
//
//			message = "<B>[src]</B> emits an irritated buzzing sound[M ? " at [M]" : ""]."
//			playsound(loc, 'sound/machines/buzz-two.ogg', 50, 0)
//			m_type = EMOTE_SOUND
//
//		if("buzz", "buzzes")
//			var/M = handle_emote_param(param)
//
//			message = "<B>[src]</B> buzzes[M ? " at [M]" : ""]."
//			playsound(loc, 'sound/machines/buzz-sigh.ogg', 50, 0)
//			m_type = EMOTE_SOUND
//
//		if("beep", "beeps")
//			var/M = handle_emote_param(param)
//
//			message = "<B>[src]</B> beeps[M ? " at [M]" : ""]."
//			playsound(loc, 'sound/machines/twobeep.ogg', 50, 0)
//			m_type = EMOTE_SOUND

		if("msqueak")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> lets out a tiny squeak[M ? " at [M]" : ""]!"
			playsound(loc, 'modular_citadel/sound/voice/mothsqueak.ogg', 50, 1, -1)
			m_type = EMOTE_SOUND

		if("squish", "squishes")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> squishes[M ? " at [M]" : ""]."
			playsound(loc, 'sound/effects/slime_squish.ogg', 50, 0) //Credit to DrMinky (freesound.org) for the sound.
			m_type = EMOTE_SOUND

//		if("yes")
//			var/M = handle_emote_param(param)
//
//			message = "<B>[src]</B> emits an affirmative blip[M ? " at [M]" : ""]."
//			playsound(loc, 'sound/machines/synth_yes.ogg', 50, 0)
//			m_type = EMOTE_SOUND

//		if("no")
//			var/M = handle_emote_param(param)
//
//			message = "<B>[src]</B> emits a negative blip[M ? " at [M]" : ""]."
//			playsound(loc, 'sound/machines/synth_no.ogg', 50, 0)
//			m_type = EMOTE_SOUND

		if("airguitar")
			if(!restrained())
				message = "<B>[src]</B> is strumming the air and headbanging like a safari chimp."
				m_type = EMOTE_VISUAL

		if("dance")
			if(!restrained())
				message = "<B>[src]</B> dances around happily."
				m_type = EMOTE_VISUAL

		if("jump")
			if(!restrained())
				message = "<B>[src]</B> jumps!"
				m_type = EMOTE_VISUAL

		if("blink", "blinks")
			message = "<B>[src]</B> blinks."
			m_type = EMOTE_VISUAL

		if("blink_r", "blinks_r")
			message = "<B>[src]</B> blinks rapidly."
			m_type = EMOTE_VISUAL

		if("bow", "bows")
			if(!buckled)
				var/M = handle_emote_param(param)

				message = "<B>[src]</B> bows[M ? " to [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("salute", "salutes")
			if(!buckled)
				var/M = handle_emote_param(param)

				message = "<B>[src]</B> salutes[M ? " to [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("choke", "chokes")
			if(miming)
				message = "<B>[src]</B> clutches [p_their()] throat desperately!"
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> chokes!"
				m_type = EMOTE_SOUND

		if("burp", "burps")
			if(miming)
				message = "<B>[src]</B> opens [p_their()] mouth rather obnoxiously."
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> burps."
				m_type = EMOTE_SOUND
		if("clap", "claps")
			if(miming)
				message = "<B>[src]</B> claps silently."
				m_type = EMOTE_VISUAL
			else
				m_type = EMOTE_SOUND
				if (!get_bodypart(BODY_ZONE_L_ARM) || !get_bodypart(BODY_ZONE_R_ARM))
					to_chat(usr, "You need hands in order to clap.")
					return
				var/clap = pick('sound/misc/clap1.ogg',
				            'sound/misc/clap2.ogg',
				            'sound/misc/clap3.ogg',
				            'sound/misc/clap4.ogg')

				message = "<b>[src]</b> claps."
				playsound(loc, clap, 50, 1, -1)

		if("flap", "flaps")
			if(!restrained())
				message = "<B>[src]</B> flaps [p_their()] wings."
				m_type = EMOTE_SOUND
				if(miming)
					m_type = EMOTE_VISUAL
				wingflap(20)

		if("flip", "flips")
			m_type = EMOTE_VISUAL
			if(!restrained())
				if(lying)
					message = "<B>[src]</B> flops and flails around on the floor."
				else
					message = "<B>[src]</B> does a flip!"
					SpinAnimation(7,1)

		if("aflap", "aflaps")
			if(!restrained())
				message = "<B>[src]</B> flaps [p_their()] wings ANGRILY!"
				m_type = EMOTE_SOUND
				if(miming)
					m_type = EMOTE_VISUAL
				wingflap(10)

		if("drool", "drools")
			message = "<B>[src]</B> drools."
			m_type = EMOTE_VISUAL

		if("eyebrow")
			message = "<B>[src]</B> raises an eyebrow."
			m_type = EMOTE_VISUAL

		if("chuckle", "chuckles")
			if(miming)
				message = "<B>[src]</B> appears to chuckle."
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> chuckles."
				m_type = EMOTE_SOUND

		if("twitch", "twitches")
			message = "<B>[src]</B> twitches violently."
			m_type = EMOTE_VISUAL

		if("twitch_s", "twitches_s")
			message = "<B>[src]</B> twitches."
			m_type = EMOTE_VISUAL

		if("faint", "faints")
			message = "<B>[src]</B> faints."
			SetSleeping(200)
			m_type = EMOTE_VISUAL

		if("cough", "coughs")
			if(reagents.get_reagent("menthol") || reagents.get_reagent("peppermint_patty"))
				return
			if(miming)
				message = "<B>[src]</B> appears to cough!"
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> coughs!"
				m_type = EMOTE_SOUND

		if("frown", "frowns")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> frowns[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("nod", "nods")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> nods[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("blush", "blushes")
			message = "<B>[src]</B> blushes."
			m_type = EMOTE_VISUAL

		if("wave", "waves")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> waves[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("quiver", "quivers")
			message = "<B>[src]</B> quivers."
			m_type = EMOTE_VISUAL

		if("gasp", "gasps")
			if(miming)
				message = "<B>[src]</B> appears to be gasping!"
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> gasps!"
				m_type = EMOTE_SOUND

		if("deathgasp", "deathgasps")
			message =  "<B>[src]</B> seizes up and falls limp, their eyes dead and lifeless..."
			if(dna.species.deathmessage)
				message = dna.species.deathmessage
			m_type = EMOTE_VISUAL

		if("giggle", "giggles")
			if(miming)
				message = "<B>[src]</B> giggles silently!"
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> giggles."
				m_type = EMOTE_SOUND

		if("glare", "glares")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> glares[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("stare", "stares")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> stares[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("look", "looks")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> looks[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("grin", "grins")
			var/M = handle_emote_param(param)

			message = "<B>[src]</B> grins[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("cry", "cries")
			if(miming)
				message = "<B>[src]</B> cries."
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> cries."
				m_type = EMOTE_SOUND

		if("sigh", "sighs")
			var/M = handle_emote_param(param)
			if(miming)
				message = "<B>[src]</B> sighs[M ? " at [M]" : ""]."
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> sighs[M ? " at [M]" : ""]."
				m_type = EMOTE_SOUND

		if("laugh", "laughs")
			var/M = handle_emote_param(param)
			if(miming)
				message = "<B>[src]</B> acts out a laugh[M ? " at [M]" : ""]."
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> laughs[M ? " at [M]" : ""]."
				m_type = EMOTE_SOUND

		if("mumble", "mumbles")
			message = "<B>[src]</B> mumbles!"
			m_type = EMOTE_SOUND
			if(miming)
				m_type = EMOTE_VISUAL

		if("grumble", "grumbles")
			var/M = handle_emote_param(param)
			if(miming)
				message = "<B>[src]</B> grumbles[M ? " at [M]" : ""]!"
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> grumbles[M ? " at [M]" : ""]!"
				m_type = EMOTE_SOUND

		if("groan", "groans")
			if(miming)
				message = "<B>[src]</B> appears to groan!"
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> groans!"
				m_type = EMOTE_SOUND

		if("moan", "moans")
			if(miming)
				message = "<B>[src]</B> appears to moan!"
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> moans!"
				m_type = EMOTE_SOUND

		if("point", "points")
			if(!restrained())
				var/atom/M = null
				if(param)
					for(var/atom/A as mob|obj|turf in view())
						if(param == A.name)
							M = A
							break

				if(!M)
					message = "<B>[src]</B> points."
				else
					pointed(M)
			m_type = EMOTE_VISUAL

		if("raise", "raises")
			if(!restrained())
				message = "<B>[src]</B> raises a hand."
			m_type = EMOTE_VISUAL

		if("shake", "shakes")
			var/M = handle_emote_param(param, 1) //Check to see if the param is valid (mob with the param name is in view) but exclude ourselves.

			message = "<B>[src]</B> shakes [p_their()] head[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("shrug", "shrugs")
			message = "<B>[src]</B> shrugs."
			m_type = EMOTE_VISUAL

		if("smile", "smiles")
			var/M = handle_emote_param(param, 1)

			message = "<B>[src]</B> smiles[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("shiver", "shivers")
			message = "<B>[src]</B> shivers."
			m_type = EMOTE_SOUND
			if(miming)
				m_type = EMOTE_VISUAL

		if("pale", "pales")
			message = "<B>[src]</B> goes pale for a second."
			m_type = EMOTE_VISUAL

		if("tremble", "trembles")
			message = "<B>[src]</B> trembles."
			m_type = EMOTE_VISUAL

		if("shudder", "shudders")
			message = "<B>[src]</B> shudders."
			m_type = EMOTE_VISUAL

		if("bshake", "bshakes")
			message = "<B>[src]</B> shakes."
			m_type = EMOTE_VISUAL

		if("sneeze", "sneezes")
			if(miming)
				message = "<B>[src]</B> sneezes."
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> sneezes."
				m_type = EMOTE_AUDIBLE

		if("sniff", "sniffs")
			message = "<B>[src]</B> sniffs."
			m_type = EMOTE_SOUND
			if(miming)
				m_type = EMOTE_VISUAL

		if("snore", "snores")
			if(miming)
				message = "<B>[src]</B> sleeps soundly."
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> snores."
				m_type = EMOTE_SOUND

		if("whimper", "whimpers")
			if(miming)
				message = "<B>[src]</B> appears hurt."
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> whimpers."
				m_type = EMOTE_SOUND

		if("wink", "winks")
			var/M = handle_emote_param(param, 1)

			message = "<B>[src]</B> winks[M ? " at [M]" : ""]."
			m_type = EMOTE_VISUAL

		if("yawn", "yawns")
			message = "<B>[src]</B> yawns."
			m_type = EMOTE_SOUND
			if(miming)
				m_type = EMOTE_VISUAL

		if("collapse", "collapses")
			src.Unconscious(40)
			message = "<B>[src]</B> collapses!"
			m_type = EMOTE_SOUND
			if(miming)
				m_type = EMOTE_VISUAL

		if("hug", "hugs")
			m_type = EMOTE_VISUAL
			if(!restrained())
				var/M = handle_emote_param(param, 1, 1) //Check to see if the param is valid (mob with the param name is in view) but exclude ourselves and only check mobs in our immediate vicinity (1 tile distance).

				if(M)
					message = "<B>[src]</B> hugs [M]."
				else
					message = "<B>[src]</B> hugs [p_them()]self."

		if("dap", "daps")
			m_type = EMOTE_VISUAL
			if(!restrained())
				var/M = handle_emote_param(param, null, 1)

				if(M)
					message = "<B>[src]</B> gives daps to [M]."
				else
					message = "<B>[src]</B> sadly can't find anybody to give daps to, and daps [p_them()]self. Shameful."

		if("slap", "slaps")
			m_type = EMOTE_VISUAL
			if(!restrained())
				var/M = handle_emote_param(param, null, 1)

				if(M)
					message = "<span class='danger'>[src] slaps [M] across the face. Ouch!</span>"
				else
					message = "<span class='danger'>[src] slaps [p_them()]self!</span>"
					adjustFireLoss(4)
				playsound(loc, 'sound/effects/snap.ogg', 50, 1)

		if("scream", "screams")
			var/M = handle_emote_param(param)
			if(miming)
				message = "<B>[src]</B> acts out a scream[M ? " at [M]" : ""]!"
				m_type = EMOTE_VISUAL
			else
				message = "<B>[src]</B> screams!"
				if(gender == MALE)
					playsound(loc, 'sound/voice/scream/scream_m1.ogg', 50, 1)
				else if(gender == FEMALE)
					playsound(loc, 'sound/voice/scream/scream_f1.ogg', 50, 1)
				else
					playsound(loc, 'sound/voice/scream/scream_r.ogg', 50, 1)
				m_type = EMOTE_AUDIBLE

		if("snap", "snaps")
			if(prob(95))
				m_type = EMOTE_SOUND

				if(!(get_bodypart(BODY_ZONE_PRECISE_R_HAND) || get_bodypart(BODY_ZONE_PRECISE_L_HAND)))
					to_chat(usr, "You need at least one hand in good working order to snap your fingers.")
					return

				var/M = handle_emote_param(param)

				message = "<b>[src]</b> snaps [p_their()] fingers[M ? " at [M]" : ""]."
				playsound(loc, 'modular_citadel/sound/voice/snap.ogg', 50, 1, -1)
			else
				message = "<span class='danger'><b>[src]</b> snaps [p_their()] fingers right off!</span>"
				playsound(loc, 'sound/effects/snap.ogg', 50, 1)

		if("snap2")
			if(prob(95))
				m_type = EMOTE_SOUND

				if(!(get_bodypart(BODY_ZONE_PRECISE_R_HAND) || get_bodypart(BODY_ZONE_PRECISE_L_HAND)))
					to_chat(usr, "You need at least one hand in good working order to snap your fingers.")
					return

				var/M = handle_emote_param(param)

				message = "<b>[src]</b> snaps [p_their()] fingers[M ? " at [M]" : ""]."
				playsound(loc, 'modular_citadel/sound/voice/snap2.ogg', 50, 1, -1)
			else
				message = "<span class='danger'><b>[src]</b> snaps [p_their()] fingers right off!</span>"
				playsound(loc, 'sound/effects/snap.ogg', 50, 1)
		
		if("snap3")
			if(prob(95))
				m_type = EMOTE_SOUND

				if(!(get_bodypart(BODY_ZONE_PRECISE_R_HAND) || get_bodypart(BODY_ZONE_PRECISE_L_HAND)))
					to_chat(usr, "You need at least one hand in good working order to snap your fingers.")
					return

				var/M = handle_emote_param(param)

				message = "<b>[src]</b> snaps [p_their()] fingers[M ? " at [M]" : ""]."
				playsound(loc, 'modular_citadel/sound/voice/snap3.ogg', 50, 1, -1)
			else
				message = "<span class='danger'><b>[src]</b> snaps [p_their()] fingers right off!</span>"
				playsound(loc, 'sound/effects/snap.ogg', 50, 1)

		if("fart", "farts")
			message = "<b>[src]</b> [pick("passes wind", "farts")]."
			m_type = EMOTE_SOUND

		if("hem")
			message = "<b>[src]</b> hems."

		if("help")
			var/emotelist = "aflap(s), airguitar, blink(s), blink(s)_r, blush(es), bow(s)-(none)/mob, burp(s), choke(s), chuckle(s), clap(s), collapse(s), cough(s),cry, cries, custom, dance, dap(s)(none)/mob," \
			+ " deathgasp(s), drool(s), eyebrow, fart(s), faint(s), flap(s), flip(s), frown(s), gasp(s), giggle(s), glare(s)-(none)/mob, grin(s), groan(s), grumble(s)," \
			+ " hug(s)-(none)/mob, hem, jump, laugh(s), look(s)-(none)/mob, moan(s), mumble(s), nod(s), pale(s), quiver(s), raise(s), salute(s)-(none)/mob, scream(s), shake(s)," \
			+ " shiver(s), shrug(s), sigh(s), slap(s)-(none)/mob, smile(s), snap(s), snap2, snap3, sneeze(s), sniff(s), snore(s), stare(s)-(none)/mob, tremble(s), twitch(es), twitch(es)_s," \
			+ " wave(s),  whimper(s), wink(s), yawn(s)"

//			switch(dna.species.name)
//				if("Drask")
//					emotelist += "\nDrask specific emotes :- drone(s)-(none)/mob, hum(s)-(none)/mob, rumble(s)-(none)/mob"
//				if("Kidan")
//					emotelist += "\nKidan specific emotes :- click(s), clack(s)"
//				if("Unathi")
//					emotelist += "\nUnathi specific emotes :- hiss(es)"
//				if("Vulpkanin")
//					emotelist += "\nVulpkanin specific emotes :- growl(s)-none/mob, howl(s)-none/mob"
//				if("Vox")
//					emotelist += "\nVox specific emotes :- quill(s)"
//				if("Diona")
//					emotelist += "\nDiona specific emotes :- creak(s)"

//			if(ismachine(src))
//				emotelist += "\nMachine specific emotes :- beep(s)-(none)/mob, buzz(es)-none/mob, no-(none)/mob, ping(s)-(none)/mob, yes-(none)/mob, buzz2-(none)/mob"
//			else
//				var/obj/item/organ/external/head/H = get_organ("head") // If you have a robotic head, you can make beep-boop noises
//				if(H && H.is_robotic())
//					emotelist += "\nRobotic head specific emotes :- beep(s)-(none)/mob, buzz(es)-none/mob, no-(none)/mob, ping(s)-(none)/mob, yes-(none)/mob, buzz2-(none)/mob"
			if(ismoth(src))
				emotelist += "\nMoth people specific emotes :- msqueak-(none)/mob"
			if(isslimeperson(src))
				emotelist += "\nSlime people specific emotes :- squish(es)-(none)/mob"

			to_chat(src, emotelist)
		else
			to_chat(src, "<span class='notice'>Unusable emote '[act]'. Say *help for a list.</span>")

	if(message) //Humans are special fucking snowflakes and have 800 lines of emotes, they get to handle their own emotes, not call the parent.
		log_emote(message, src)

 //Hearing gasp and such every five seconds is not good emotes were not global for a reason.
 // Maybe some people are okay with that.

		for(var/mob/M in GLOB.dead_mob_list)
			if(!M.client || istype(M, /mob/dead/new_player))
				continue //skip monkeys, leavers and new players

			if(M.stat == DEAD && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT) && !(M in viewers(src,null)))
				M.show_message(message)

		switch(m_type)
			if(EMOTE_VISUAL)
				visible_message(message)
			if(EMOTE_SOUND)
				audible_message(message)

/mob/living/carbon/human/proc/wingflap(wing_time)
	var/open = FALSE
	if(dna.features["wings"] != "None")
		if("wingsopen" in dna.species.mutant_bodyparts)
			open = TRUE
			CloseWings()
		else
			OpenWings()
		addtimer(CALLBACK(src, open ? /mob/living/carbon/human.proc/OpenWings : /mob/living/carbon/human.proc/CloseWings), wing_time)

/mob/living/carbon/human/proc/OpenWings()
	if(!dna || !dna.species)
		return
	if("wings" in dna.species.mutant_bodyparts)
		dna.species.mutant_bodyparts -= "wings"
		dna.species.mutant_bodyparts |= "wingsopen"
	update_body()

/mob/living/carbon/human/proc/CloseWings()
	if(!dna || !dna.species)
		return
	if("wingsopen" in dna.species.mutant_bodyparts)
		dna.species.mutant_bodyparts -= "wingsopen"
		dna.species.mutant_bodyparts |= "wings"
	update_body()
	if(isturf(loc))
		var/turf/T = loc
		T.Entered(src)
