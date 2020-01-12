/obj/item/clothing/suit
	icon = 'icons/obj/clothing/suits.dmi'
	name = "suit"
	var/fire_resist = T0C+100
	allowed = list(/obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	slot_flags = ITEM_SLOT_OCLOTHING
	body_parts_covered = CHEST
	var/blood_overlay_type = "suit"
	var/togglename = null
	var/suittoggled = FALSE
<<<<<<< HEAD

	var/adjusted = NORMAL_STYLE
	mutantrace_variation = MUTANTRACE_VARIATION
	var/dimension_x = 32
	var/dimension_y = 32
	var/center = FALSE	//Should we center the sprite?

/obj/item/clothing/suit/equipped(mob/user, slot)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		if(mutantrace_variation)
			if(DIGITIGRADE in H.dna.species.species_traits)
				adjusted = ALT_STYLE
				H.update_inv_wear_suit()
			else if(adjusted == ALT_STYLE)
				adjusted = NORMAL_STYLE

		H.update_inv_wear_suit()


/obj/item/clothing/suit/worn_overlays(isinhands = FALSE)
	. = list()
=======
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/worn_overlays(isinhands = FALSE, icon_file, style_flags = NONE)
	. = ..()
>>>>>>> e90cef5c69... Merge pull request #10544 from AffectedArc07/file-standardisation
	if(!isinhands)
		if(damaged_clothes)
			. += mutable_appearance('icons/effects/item_damage.dmi', "damaged[blood_overlay_type]")
		if(blood_DNA)
<<<<<<< HEAD
			. += mutable_appearance('icons/effects/blood.dmi', "[blood_overlay_type]blood", color = blood_DNA_to_color())
=======
			var/file2use = (style_flags & STYLE_ALL_TAURIC) ? 'modular_citadel/icons/mob/64x32_effects.dmi' : 'icons/effects/blood.dmi'
			. += mutable_appearance(file2use, "[blood_overlay_type]blood", color = blood_DNA_to_color())
>>>>>>> e90cef5c69... Merge pull request #10544 from AffectedArc07/file-standardisation
		var/mob/living/carbon/human/M = loc
		if(ishuman(M) && M.w_uniform)
			var/obj/item/clothing/under/U = M.w_uniform
			if(istype(U) && U.attached_accessory)
				var/obj/item/clothing/accessory/A = U.attached_accessory
				if(A.above_suit)
					. += U.accessory_overlay

/obj/item/clothing/suit/update_clothes_damaged_state(damaging = TRUE)
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_suit()
