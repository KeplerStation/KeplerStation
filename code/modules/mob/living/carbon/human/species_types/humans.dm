/datum/species/human
	name = "Human"
	id = "human"
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,MUTCOLORS_PARTSONLY)
<<<<<<< HEAD
	default_features = list("mcolor" = "FFF", "mcolor2" = "FFF","mcolor3" = "FFF","wings" = "None")
=======
	mutant_bodyparts = list("ears", "tail_human", "wings", "taur", "deco_wings") // CITADEL EDIT gives humans snowflake parts
	default_features = list("mcolor" = "FFF", "mcolor2" = "FFF","mcolor3" = "FFF","tail_human" = "None", "ears" = "None", "wings" = "None", "taur" = "None", "deco_wings" = "None")
>>>>>>> 671fdf32c... Merge pull request #9520 from r4d6/master
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW
	liked_food = JUNKFOOD | FRIED

/datum/species/human/qualifies_for_rank(rank, list/features)
	return TRUE	//Pure humans are always allowed in all roles.
