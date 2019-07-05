/obj/item/card/emag/examine(mob/user)
	. = ..()
	if(uses <= 50000)
		to_chat(user, "<span class='notice'>It has <b>[uses ? uses : "no"]</b> charges left.</span>")
	else
		to_chat(user, "<span class='notice'>It almost seems to have unlimited potential.</span>")