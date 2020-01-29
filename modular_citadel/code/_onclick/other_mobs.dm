/mob/living/carbon/human/AltUnarmedAttack(atom/A, proximity)
	if(!has_active_hand())
		to_chat(src, "<span class='notice'>You look at the state of the universe and sigh.</span>") //lets face it, people rarely ever see this message in its intended condition.
		return TRUE

	if(!A.alt_attack_hand(src))
		A.attack_hand(src)
		return TRUE
	return TRUE

/mob/living/carbon/human/AltRangedAttack(atom/A, params)
	if(!has_active_hand())
		to_chat(src, "<span class='notice'>You ponder your life choices and sigh.</span>")
		return TRUE
<<<<<<< HEAD
=======
	var/list/src_viewers = viewers(DEFAULT_MESSAGE_RANGE, src) - src // src has a different message.
	var/the_action = "waves to [A]"
	var/what_action = "waves to something you can't see"
	var/self_action = "wave to [A]"

	switch(a_intent)
		if(INTENT_DISARM)
			the_action = "shoos away [A]"
			what_action = "shoo away something you can't see"
			self_action = "shoo away [A]"
		if(INTENT_GRAB)
			the_action = "beckons [A] to come"
			what_action = "beckons something you can't see to come"
			self_action = "beckon [A] to come"
		if(INTENT_HARM)
			var/pronoun = "[p_their()]"
			the_action = "shakes [pronoun] fist at [A]"
			what_action = "shakes [pronoun] fist at something you can't see"
			self_action = "shake your fist at [A]"
>>>>>>> c5fdc24e73... Merge pull request #10696 from Citadel-Station-13/Ghommie-patch-1

	if(!incapacitated())
		switch(a_intent)
			if(INTENT_HELP)
				visible_message("<span class='notice'>[src] waves to [A].</span>", "<span class='notice'>You wave to [A].</span>")
			if(INTENT_DISARM)
				visible_message("<span class='notice'>[src] shoos away [A].</span>", "<span class='notice'>You shoo away [A].</span>")
			if(INTENT_GRAB)
				visible_message("<span class='notice'>[src] beckons [A] to come.</span>", "<span class='notice'>You beckon [A] to come closer.</span>") //This sounds lewder than it actually is. Fuck.
			if(INTENT_HARM)
				visible_message("<span class='notice'>[src] shakes [p_their()] fist at [A].</span>", "<span class='notice'>You shake your fist at [A].</span>")
		return TRUE

/atom/proc/alt_attack_hand(mob/user)
	return FALSE
