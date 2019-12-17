/datum/species/abductor
	name = "Abductor"
	id = "abductor"
	say_mod = "gibbers"
	sexes = FALSE
<<<<<<< HEAD
	species_traits = list(NOBLOOD,NOEYES,NO_BONES)
	inherent_traits = list(TRAIT_VIRUSIMMUNE,TRAIT_NOGUNS,TRAIT_NOHUNGER,TRAIT_NOBREATH)
=======
	species_traits = list(NOBLOOD,NOEYES,NOGENITALS,NOAROUSAL)
	inherent_traits = list(TRAIT_VIRUSIMMUNE,TRAIT_CHUNKYFINGERS,TRAIT_NOHUNGER,TRAIT_NOBREATH)
>>>>>>> 7017ab243b... Merge pull request #10216 from Ghommie/Ghommie-cit474
	mutanttongue = /obj/item/organ/tongue/abductor

/datum/species/abductor/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	var/datum/atom_hud/abductor_hud = GLOB.huds[DATA_HUD_ABDUCTOR]
	abductor_hud.add_hud_to(C)

/datum/species/abductor/on_species_loss(mob/living/carbon/C)
	. = ..()
	var/datum/atom_hud/abductor_hud = GLOB.huds[DATA_HUD_ABDUCTOR]
	abductor_hud.remove_hud_from(C)
