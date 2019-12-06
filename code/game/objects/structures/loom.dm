//Loom, turns raw cotton and durathread into their respective fabrics.

/obj/structure/loom
	name = "loom"
	desc = "A simple device used to weave cloth and other thread-based fabrics together into usable material."
	icon = 'icons/obj/hydroponics/equipment.dmi'
	icon_state = "loom"
	density = TRUE
	anchored = TRUE

<<<<<<< HEAD
/obj/structure/loom/attackby(obj/item/stack/sheet/W, mob/user)
	if(W.is_fabric && W.amount > 1)
		user.show_message("<span class='notice'>You start weaving the [W.name] through the loom..</span>", 1)
		if(W.use_tool(src, user, W.pull_effort))
			new W.loom_result(drop_location())
			user.show_message("<span class='notice'>You weave the [W.name] into a workable fabric.</span>", 1)
			W.amount = (W.amount - 2)
			if(W.amount < 1)
				qdel(W)
	else
		user.show_message("<span class='notice'>You need a valid fabric and at least 2 of said fabric before using this.</span>", 1)
=======
/obj/structure/loom/attackby(obj/item/I, mob/user)
	if(weave(I, user))
		return
	return ..()

/obj/structure/loom/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I, 5)
	return TRUE

///Handles the weaving.
/obj/structure/loom/proc/weave(obj/item/stack/sheet/S, mob/user)
	if(!istype(S) || !S.is_fabric)
		return FALSE
	if(!anchored)
		user.show_message("<span class='notice'>The loom needs to be wrenched down.</span>", MSG_VISUAL)
		return FALSE
	if(S.amount < FABRIC_PER_SHEET)
		user.show_message("<span class='notice'>You need at least [FABRIC_PER_SHEET] units of fabric before using this.</span>", 1)
		return FALSE
	user.show_message("<span class='notice'>You start weaving \the [S.name] through the loom..</span>", MSG_VISUAL)
	if(S.use_tool(src, user, S.pull_effort))
		if(S.amount >= FABRIC_PER_SHEET)
			new S.loom_result(drop_location())
			S.use(FABRIC_PER_SHEET)
			user.show_message("<span class='notice'>You weave \the [S.name] into a workable fabric.</span>", MSG_VISUAL)
	return TRUE

/obj/structure/loom/unanchored
	anchored = FALSE

#undef FABRIC_PER_SHEET
>>>>>>> 4e022af46f... Merge pull request #10056 from Ghommie/Ghommie-cit430
