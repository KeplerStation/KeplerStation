/mob/living/silicon/ai/examine(mob/user)
	var/msg = "<span class='info'>*---------*\nThis is [icon2html(src, user)] <EM>[src]</EM>!\n"
	if (stat == DEAD)
		msg += "<span class='deadsay'>It appears to be powered-down.</span>\n"
	else
<<<<<<< HEAD
		msg += "<span class='warning'>"
		if (getBruteLoss())
			if (getBruteLoss() < 30)
				msg += "It looks slightly dented.\n"
			else
				msg += "<B>It looks severely dented!</B>\n"
		if (getFireLoss())
			if (getFireLoss() < 30)
				msg += "It looks slightly charred.\n"
			else
				msg += "<B>Its casing is melted and heat-warped!</B>\n"
		msg += "</span>"
=======
		if (getBruteLoss())
			if (getBruteLoss() < 30)
				. += "<span class='warning'>It looks slightly dented.</span>"
			else
				. += "<span class='danger'>It looks severely dented!</span>"
		if (getFireLoss())
			if (getFireLoss() < 30)
				. += "<span class='warning'>It looks slightly charred.</span>"
			else
				. += "<span class='danger'>Its casing is melted and heat-warped!</span>"
>>>>>>> e1a9c8e6d3... Merge pull request #9972 from Ghommie/Ghommie-cit403
		if(deployed_shell)
			msg += "The wireless networking light is blinking.\n"
		else if (!shunted && !client)
			msg += "[src]Core.exe has stopped responding! NTOS is searching for a solution to the problem...\n"
	msg += "*---------*</span>"

	to_chat(user, msg)
	..()
	return msg