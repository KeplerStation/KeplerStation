/*
 * Science
 */
/obj/item/clothing/under/rank/research_director
	desc = "It's a suit worn by those with the know-how to achieve the position of \"Research Director\". Its fabric provides minor protection from biological contaminants."
	name = "research director's vest suit"
	icon_state = "director"
	item_state = "lb_suit"
	item_color = "director"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 10, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 35)
	can_adjust = FALSE

<<<<<<< HEAD
/obj/item/clothing/under/rank/research_director/dress
	name = "research director dress uniform"
	desc = "Feminine fashion for the style concious RD."
	icon_state = "dress_rd"
	item_color = "dress_rd"
=======
/obj/item/clothing/under/rank/research_director/skirt
	name = "research director's vest suitskirt"
	desc = "It's a suitskirt worn by those with the know-how to achieve the position of \"Research Director\". Its fabric provides minor protection from biological contaminants."
	icon_state = "director_skirt"
	item_state = "lb_suit"
	item_color = "director_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
>>>>>>> 751e87b96... Merge pull request #8970 from Sishen1542/master

/obj/item/clothing/under/rank/research_director/alt
	desc = "Maybe you'll engineer your own half-man, half-pig creature some day. Its fabric provides minor protection from biological contaminants."
	name = "research director's tan suit"
	icon_state = "rdwhimsy"
	item_state = "rdwhimsy"
	item_color = "rdwhimsy"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 10, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/research_director/alt/skirt
	name = "research director's tan suitskirt"
	desc = "Maybe you'll engineer your own half-man, half-pig creature some day. Its fabric provides minor protection from biological contaminants."
	icon_state = "rdwhimsy_skirt"
	item_state = "rdwhimsy"
	item_color = "rdwhimsy_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/research_director/turtleneck
	desc = "A dark purple turtleneck and tan khakis, for a director with a superior sense of style."
	name = "research director's turtleneck"
	icon_state = "rdturtle"
	item_state = "p_suit"
	item_color = "rdturtle"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 10, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/research_director/turtleneck/skirt
	name = "research director's turtleneck skirt"
	desc = "A dark purple turtleneck and tan khaki skirt, for a director with a superior sense of style."
	icon_state = "rdturtle_skirt"
	item_state = "p_suit"
	item_color = "rdturtle_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/scientist
	desc = "It's made of a special fiber that provides minor protection against explosives. It has markings that denote the wearer as a scientist."
	name = "scientist's jumpsuit"
	icon_state = "toxins"
	item_state = "w_suit"
	item_color = "toxinswhite"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/scientist/skirt
	name = "scientist's jumpskirt"
<<<<<<< HEAD
	icon_state = "sciencewhitef"
	item_color = "sciencewhitef"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
=======
	desc = "It's made of a special fiber that provides minor protection against explosives. It has markings that denote the wearer as a scientist."
	icon_state = "toxinswhite_skirt"
	item_state = "w_suit"
	item_color = "toxinswhite_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
>>>>>>> 751e87b96... Merge pull request #8970 from Sishen1542/master

/obj/item/clothing/under/rank/chemist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a chemist rank stripe on it."
	name = "chemist's jumpsuit"
	icon_state = "chemistry"
	item_state = "w_suit"
	item_color = "chemistrywhite"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 50, "acid" = 65)

/obj/item/clothing/under/rank/chemist/skirt
	name = "chemist's jumpskirt"
<<<<<<< HEAD
	icon_state = "chemistrywhitef"
	item_color = "chemistrywhitef"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
=======
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a chemist rank stripe on it."
	icon_state = "chemistrywhite_skirt"
	item_state = "w_suit"
	item_color = "chemistrywhite_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
>>>>>>> 751e87b96... Merge pull request #8970 from Sishen1542/master

/*
 * Medical
 */
/obj/item/clothing/under/rank/chief_medical_officer
	desc = "It's a jumpsuit worn by those with the experience to be \"Chief Medical Officer\". It provides minor biological protection."
	name = "chief medical officer's jumpsuit"
	icon_state = "cmo"
	item_state = "w_suit"
	item_color = "cmo"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/chief_medical_officer/skirt
<<<<<<< HEAD
	desc = "It's a jumpskirt worn by those with the experience to be \"Chief Medical Officer\". It provides minor biological protection."
	name = "chief medical officer's jumpskirt"
	icon_state = "cmof"
	item_color = "cmof"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
=======
	name = "chief medical officer's jumpskirt"
	desc = "It's a jumpskirt worn by those with the experience to be \"Chief Medical Officer\". It provides minor biological protection."
	icon_state = "cmo_skirt"
	item_state = "w_suit"
	item_color = "cmo_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
>>>>>>> 751e87b96... Merge pull request #8970 from Sishen1542/master

/obj/item/clothing/under/rank/geneticist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a genetics rank stripe on it."
	name = "geneticist's jumpsuit"
	icon_state = "genetics"
	item_state = "w_suit"
	item_color = "geneticswhite"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/geneticist/skirt
	name = "geneticist's jumpskirt"
<<<<<<< HEAD
	icon_state = "geneticswhitef"
	item_color = "geneticswhitef"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
=======
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a genetics rank stripe on it."
	icon_state = "geneticswhite_skirt"
	item_state = "w_suit"
	item_color = "geneticswhite_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
>>>>>>> 751e87b96... Merge pull request #8970 from Sishen1542/master

/obj/item/clothing/under/rank/virologist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a virologist rank stripe on it."
	name = "virologist's jumpsuit"
	icon_state = "virology"
	item_state = "w_suit"
	item_color = "virologywhite"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/virologist/skirt
	name = "virologist's jumpskirt"
<<<<<<< HEAD
	icon_state = "virologywhitef"
	item_color = "virologywhitef"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
=======
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a virologist rank stripe on it."
	icon_state = "virologywhite_skirt"
	item_state = "w_suit"
	item_color = "virologywhite_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
>>>>>>> 751e87b96... Merge pull request #8970 from Sishen1542/master

/obj/item/clothing/under/rank/nursesuit
	desc = "It's a jumpsuit commonly worn by nursing staff in the medical department."
	name = "nurse's suit"
	icon_state = "nursesuit"
	item_state = "w_suit"
	item_color = "nursesuit"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = NO_FEMALE_UNIFORM
	can_adjust = FALSE
/obj/item/clothing/under/rank/medical
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a cross on the chest denoting that the wearer is trained medical personnel."
	name = "medical doctor's jumpsuit"
	icon_state = "medical"
	item_state = "w_suit"
	item_color = "medical"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)
<<<<<<< HEAD

/obj/item/clothing/under/rank/medical/skirt
	name = "medical doctor's jumpskirt"
	icon_state = "medicalf"
	item_color = "medicalf"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

=======
>>>>>>> 751e87b96... Merge pull request #8970 from Sishen1542/master
/obj/item/clothing/under/rank/medical/blue
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in baby blue."
	icon_state = "scrubsblue"
	item_color = "scrubsblue"
	can_adjust = FALSE
/obj/item/clothing/under/rank/medical/green
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in dark green."
	icon_state = "scrubsgreen"
	item_color = "scrubsgreen"
	can_adjust = FALSE
/obj/item/clothing/under/rank/medical/purple
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in deep purple."
	icon_state = "scrubspurple"
	item_color = "scrubspurple"
	can_adjust = FALSE

/obj/item/clothing/under/rank/medical/skirt
	name = "medical doctor's jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a cross on the chest denoting that the wearer is trained medical personnel."
	icon_state = "medical_skirt"
	item_state = "w_suit"
	item_color = "medical_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP 
