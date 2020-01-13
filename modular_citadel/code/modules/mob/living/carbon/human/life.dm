/mob/living/carbon/human/update_health_hud(shown_health_amount)
	. = ..()
	if(!client || !hud_used)
		return
	if(hud_used.staminas)
		hud_used.staminas?.update_icon_state()
	if(hud_used.staminabuffer)
		hud_used.staminabuffer?.update_icon_state()
