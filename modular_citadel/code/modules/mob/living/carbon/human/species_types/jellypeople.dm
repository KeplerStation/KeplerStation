/datum/species/jelly/slime
	name = "Xenobiological Slimeperson"

//##########SLIMEPEOPLE##########

/datum/species/jelly/roundstartslime
	name = "Slimeperson"
	id = "slimeperson"
	limbs_id = "slime"
	default_color = "00FFFF"
	species_traits = list(MUTCOLORS,EYECOLOR,HAIR,FACEHAIR,NOBLOOD)
	inherent_traits = list(TRAIT_TOXINLOVER)
	default_features = list("mcolor" = "FFF", "mcolor2" = "FFF","mcolor3" = "FFF")
	say_mod = "says"
	hair_color = "mutcolor"
	hair_alpha = 160 //a notch brighter so it blends better.
	coldmod = 3
	heatmod = 1
	burnmod = 1

/datum/action/innate/slime_change
	name = "Alter Hair"
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "alter_form" //placeholder
	icon_icon = 'modular_citadel/icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"

/datum/action/innate/slime_change/Activate()
	var/mob/living/carbon/human/H = owner
	if(!isjellyperson(H))
		return
	else
		H.visible_message("<span class='notice'>[owner] gains a look of \
		concentration while standing perfectly still.\
		 Their body seems to shift and starts getting more goo-like.</span>",
		"<span class='notice'>You focus intently on altering your body while \
		standing perfectly still...</span>")
		change_form()

/datum/action/innate/slime_change/proc/change_form()
	var/mob/living/carbon/human/H = owner
	if(H.gender == MALE)
		var/new_style = input(owner, "Select a facial hair style", "Hair Alterations")  as null|anything in GLOB.facial_hair_styles_list
		if(new_style)
			H.facial_hair_style = new_style
	else
		H.facial_hair_style = "Shaved"
		//handle normal hair
	var/new_style = input(owner, "Select a hair style", "Hair Alterations")  as null|anything in GLOB.hair_styles_list
	if(new_style)
		H.hair_style = new_style
		H.update_hair()
