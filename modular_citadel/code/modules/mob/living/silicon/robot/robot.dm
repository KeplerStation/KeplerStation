<<<<<<< HEAD
=======
mob/living/silicon
	no_vore = TRUE

/mob/living/silicon/robot
	var/dogborg = FALSE

/mob/living/silicon/robot/lay_down()
	..()
	update_canmove()

/mob/living/silicon/robot/update_canmove()
	..()
	if(client && stat != DEAD && dogborg == FALSE)
		if(resting)
			cut_overlays()
			icon_state = "[module.cyborg_base_icon]-rest"
		else
			icon_state = "[module.cyborg_base_icon]"
	update_icons()




>>>>>>> 8a1e097ba... Merge pull request #9243 from BlackMajor/Doggo-sit
/mob/living/silicon/robot/adjustStaminaLossBuffered(amount, updating_stamina = 1)
	if(istype(cell))
		cell.charge -= amount*5

/mob/living/silicon/robot
	var/disabler
	var/laser
