<<<<<<< HEAD
/obj/item/clothing/mask
	name = "mask"
	icon = 'icons/obj/clothing/masks.dmi'
	body_parts_covered = HEAD
	slot_flags = ITEM_SLOT_MASK
	strip_delay = 40
	equip_delay_other = 40
	var/modifies_speech = FALSE
	var/mask_adjusted = 0
	var/adjusted_flags = null
	var/muzzle_var = NORMAL_STYLE
	mutantrace_variation = NO_MUTANTRACE_VARIATION //most masks have overrides, but not all probably.


/obj/item/clothing/mask/attack_self(mob/user)
	if(CHECK_BITFIELD(clothing_flags, VOICEBOX_TOGGLABLE))
		TOGGLE_BITFIELD(clothing_flags, VOICEBOX_DISABLED)
		var/status = !CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED)
		to_chat(user, "<span class='notice'>You turn the voice box in [src] [status ? "on" : "off"].</span>")

/obj/item/clothing/mask/equipped(mob/M, slot)
	. = ..()
	if (slot == SLOT_WEAR_MASK && modifies_speech)
		RegisterSignal(M, COMSIG_MOB_SAY, .proc/handle_speech)
	else
		UnregisterSignal(M, COMSIG_MOB_SAY)
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/datum/species/pref_species = H.dna.species

	if(mutantrace_variation)
		if("mam_snouts" in pref_species.default_features)
			if(H.dna.features["mam_snouts"] != "None")
				muzzle_var = ALT_STYLE
			else
				muzzle_var = NORMAL_STYLE

		else if("snout" in pref_species.default_features)
			if(H.dna.features["snout"] != "None")
				muzzle_var = ALT_STYLE
			else
				muzzle_var = NORMAL_STYLE

		else
			muzzle_var = NORMAL_STYLE

		H.update_inv_wear_mask()

/obj/item/clothing/mask/dropped(mob/M)
	. = ..()
	UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/clothing/mask/proc/handle_speech()

/obj/item/clothing/mask/worn_overlays(isinhands = FALSE)
	. = list()
	if(!isinhands)
		if(body_parts_covered & HEAD)
			if(damaged_clothes)
				. += mutable_appearance('icons/effects/item_damage.dmi', "damagedmask")
			if(blood_DNA)
				. += mutable_appearance('icons/effects/blood.dmi', "maskblood", color = blood_DNA_to_color())

/obj/item/clothing/mask/update_clothes_damaged_state(damaging = TRUE)
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_mask()

//Proc that moves gas/breath masks out of the way, disabling them and allowing pill/food consumption
/obj/item/clothing/mask/proc/adjustmask(mob/living/user)
	if(user && user.incapacitated())
		return
	mask_adjusted = !mask_adjusted
	if(!mask_adjusted)
		src.icon_state = initial(icon_state)
		gas_transfer_coefficient = initial(gas_transfer_coefficient)
		permeability_coefficient = initial(permeability_coefficient)
		clothing_flags |= visor_flags
		flags_inv |= visor_flags_inv
		flags_cover |= visor_flags_cover
		to_chat(user, "<span class='notice'>You push \the [src] back into place.</span>")
		slot_flags = initial(slot_flags)
	else
		icon_state += "_up"
		to_chat(user, "<span class='notice'>You push \the [src] out of the way.</span>")
		gas_transfer_coefficient = null
		permeability_coefficient = null
		clothing_flags &= ~visor_flags
		flags_inv &= ~visor_flags_inv
		flags_cover &= ~visor_flags_cover
		if(adjusted_flags)
			slot_flags = adjusted_flags
	if(user)
		user.wear_mask_update(src, toggle_off = mask_adjusted)
		user.update_action_buttons_icon() //when mask is adjusted out, we update all buttons icon so the user's potential internal tank correctly shows as off.
=======
/obj/item/clothing/mask
	name = "mask"
	icon = 'icons/obj/clothing/masks.dmi'
	body_parts_covered = HEAD
	slot_flags = ITEM_SLOT_MASK
	strip_delay = 40
	equip_delay_other = 40
	var/modifies_speech = FALSE
	var/mask_adjusted = 0
	var/adjusted_flags = null

/obj/item/clothing/mask/attack_self(mob/user)
	if(CHECK_BITFIELD(clothing_flags, VOICEBOX_TOGGLABLE))
		TOGGLE_BITFIELD(clothing_flags, VOICEBOX_DISABLED)
		var/status = !CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED)
		to_chat(user, "<span class='notice'>You turn the voice box in [src] [status ? "on" : "off"].</span>")

/obj/item/clothing/mask/equipped(mob/M, slot)
	. = ..()
	if (slot == SLOT_WEAR_MASK && modifies_speech)
		RegisterSignal(M, COMSIG_MOB_SAY, .proc/handle_speech)
	else
		UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/clothing/mask/dropped(mob/M)
	. = ..()
	UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/clothing/mask/proc/handle_speech()

/obj/item/clothing/mask/worn_overlays(isinhands = FALSE, icon_file, style_flags = NONE)
	. = list()
	if(!isinhands)
		if(body_parts_covered & HEAD)
			if(damaged_clothes)
				. += mutable_appearance('icons/effects/item_damage.dmi', "damagedmask")
			if(blood_DNA)
				. += mutable_appearance('icons/effects/blood.dmi', "maskblood", color = blood_DNA_to_color())

/obj/item/clothing/mask/update_clothes_damaged_state(damaging = TRUE)
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_mask()

//Proc that moves gas/breath masks out of the way, disabling them and allowing pill/food consumption
/obj/item/clothing/mask/proc/adjustmask(mob/living/user)
	if(user && user.incapacitated())
		return
	mask_adjusted = !mask_adjusted
	if(!mask_adjusted)
		src.icon_state = initial(icon_state)
		gas_transfer_coefficient = initial(gas_transfer_coefficient)
		permeability_coefficient = initial(permeability_coefficient)
		clothing_flags |= visor_flags
		flags_inv |= visor_flags_inv
		flags_cover |= visor_flags_cover
		to_chat(user, "<span class='notice'>You push \the [src] back into place.</span>")
		slot_flags = initial(slot_flags)
	else
		icon_state += "_up"
		to_chat(user, "<span class='notice'>You push \the [src] out of the way.</span>")
		gas_transfer_coefficient = null
		permeability_coefficient = null
		clothing_flags &= ~visor_flags
		flags_inv &= ~visor_flags_inv
		flags_cover &= ~visor_flags_cover
		if(adjusted_flags)
			slot_flags = adjusted_flags
	if(user)
		user.wear_mask_update(src, toggle_off = mask_adjusted)
		user.update_action_buttons_icon() //when mask is adjusted out, we update all buttons icon so the user's potential internal tank correctly shows as off.
>>>>>>> e90cef5c69... Merge pull request #10544 from AffectedArc07/file-standardisation
