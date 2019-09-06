datum/preferences/copy_to(mob/living/carbon/human/character)
	..()
	character.flavor_text = features["flavor_text"] //Let's update their flavor_text at least initially