/obj/structure/dresser
	name = "dresser"
	desc = "A nicely-crafted wooden dresser. It's filled with lots of undies."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "dresser"
	density = TRUE
	anchored = TRUE

/obj/structure/dresser/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wrench))
		to_chat(user, "<span class='notice'>You begin to [anchored ? "unwrench" : "wrench"] [src].</span>")
		if(I.use_tool(src, user, 20, volume=50))
			to_chat(user, "<span class='notice'>You successfully [anchored ? "unwrench" : "wrench"] [src].</span>")
			setAnchored(!anchored)
	else
		return ..()

/obj/structure/dresser/deconstruct(disassembled = TRUE)
	new /obj/item/stack/sheet/mineral/wood(drop_location(), 10)
	qdel(src)

/obj/structure/dresser/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(!Adjacent(user))//no tele-grooming
		return
<<<<<<< HEAD
	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		if(H.dna && H.dna.species && (NO_UNDERWEAR in H.dna.species.species_traits))
			to_chat(user, "<span class='warning'>You are not capable of wearing underwear.</span>")
			return

		var/choice = input(user, "Underwear, Undershirt, or Socks?", "Changing") as null|anything in list("Underwear","Undershirt","Socks")

		if(!Adjacent(user))
			return
		switch(choice)
			if("Underwear")
				var/new_undies = input(user, "Select your underwear", "Changing")  as null|anything in GLOB.underwear_list
				if(new_undies)
					H.underwear = new_undies

			if("Undershirt")
				var/new_undershirt = input(user, "Select your undershirt", "Changing") as null|anything in GLOB.undershirt_list
				if(new_undershirt)
					H.undershirt = new_undershirt
			if("Socks")
				var/new_socks = input(user, "Select your socks", "Changing") as null|anything in GLOB.socks_list
				if(new_socks)
					H.socks= new_socks

		add_fingerprint(H)
		H.update_body()
=======
	var/dye_undie = FALSE
	var/dye_shirt = FALSE
	var/dye_socks = FALSE
	switch(choice)
		if("Underwear")
			var/new_undies = input(H, "Select your underwear", "Changing") as null|anything in GLOB.underwear_list
			if(H.underwear)
				H.underwear = new_undies
				H.saved_underwear = new_undies
				var/datum/sprite_accessory/underwear/bottom/B = GLOB.underwear_list[new_undies]
				dye_undie = B?.has_color
		if("Undershirt")
			var/new_undershirt = input(H, "Select your undershirt", "Changing") as null|anything in GLOB.undershirt_list
			if(new_undershirt)
				H.undershirt = new_undershirt
				H.saved_undershirt = new_undershirt
				var/datum/sprite_accessory/underwear/top/T = GLOB.undershirt_list[new_undershirt]
				dye_shirt = T?.has_color
		if("Socks")
			var/new_socks = input(H, "Select your socks", "Changing") as null|anything in GLOB.socks_list
			if(new_socks)
				H.socks = new_socks
				H.saved_socks = new_socks
				var/datum/sprite_accessory/underwear/socks/S = GLOB.socks_list[new_socks]
				dye_socks = S?.has_color
	if(dye_undie || choice == "Underwear Color")
		H.undie_color = recolor_undergarment(H, "underwear", H.undie_color)
	if(dye_shirt || choice == "Undershirt Color")
		H.shirt_color = recolor_undergarment(H, "undershirt", H.shirt_color)
	if(dye_socks || choice == "Socks Color")
		H.socks_color = recolor_undergarment(H, "socks", H.socks_color)

	add_fingerprint(H)
	H.update_body()

/obj/structure/dresser/proc/recolor_undergarment(mob/living/carbon/human/H, garment_type = "underwear", default_color)
	var/n_color = input(H, "Choose your [garment_type]'\s color.", "Character Preference", default_color) as color|null
	if(!n_color || !H.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return default_color
	return sanitize_hexcolor(n_color, include_crunch= TRUE)
>>>>>>> 8452cf3b8... Merge pull request #9014 from Ghommie/Ghommie-cit170
