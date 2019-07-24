/datum/gear/ceskirt
	name = "Chief Engineer's Jumpskirt"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/rank/chief_engineer/skirt
	restricted_roles = list("Chief Engineer")
	restricted_desc = "Chief Engineer"

/datum/gear/engiskirt
	name = "Engineer's Jumpskirt"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/rank/engineer/skirt
	restricted_roles = list("Station Engineer", "Chief Engineer")
	restricted_desc = "Station Engineer and Chief Engineer"

/datum/gear/atmosskirt
	name = "Atmospheric Technician's Jumpskirt"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/rank/atmospheric_technician/skirt
	restricted_roles = list("Atmospheric Technician", "Chief Engineer")
	restricted_desc = "Atmospheric Technician and Chief Engineer"
