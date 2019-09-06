/obj/item/paper/pamphlet
	name = "pamphlet"
	icon_state = "pamphlet"

/obj/item/paper/pamphlet/gateway
	info = "<b>Welcome to the Horizons Gateway project...</b><br>\
			Congratulations! If you're reading this, you and your superiors have decided that you're \
			ready to commit to a life spent colonising the rolling hills of far away worlds. You \
			must be ready for a lifetime of adventure, a little bit of hard work, and an award \
			winning dental plan! But that's not all the Horizons Gateway project has to offer.<br>\
			<br>Because we care about the future of huamnity, we feel it is only fair to make sure you know the risks \
			before you commit to joining the Gateway project. All away destinations have \
			been fully scanned by an expeditionary team, and are certified to be 32% safe. \
			We've even left a case of space beer along with the basic materials you'll need to expand \
			our operational area and start your new life.<br><br>\
			<b>Gateway Operation Basics</b><br>\
			All company approved Gateways operate on the same basic principles. They operate off \
			area equipment power as you would expect, and without this supply, it cannot safely function, \
			causinng it to reject all attempts at operation.<br><br>\
			Once it is correctly setup, and once it has enough power to operate, the Gateway will begin \
			searching for an output location. The amount of time this takes is variable, but the Gateway \
			interface will give you an estimate accurate to the minute. Power loss will not interrupt the \
			searching process. Influenza will not interrupt the searching process. Temporal anomalies \
			may cause the estimate to be inaccurate, but will not interrupt the searching process.<br><br> \
			<b>Life On The Other Side</b><br>\
			Once you have traversed the Gateway, you may experience some disorientation. Do not panic. \
			This is a normal side effect of travelling vast distances in a short period of time. You should \
			survey the immediate area, and attempt to locate your complimentary case of space beer. Our \
			expeditionary teams have ensured the complete safety of all away locations, but in a small \
			number of cases, the Gateway they have established may not be immediately obvious. \
			Do not panic if you cannot locate the return Gateway. Begin colonisation of the destination. \
			<br><br><b>A New World</b><br>\
			As a participant in the Horizons Gateway Project, you will be on the frontiers of space. \
			Though we've prepared you for a safe journey, participants are advised to prepare for inhospitable \
			environs."

//we don't want the silly text overlay!
/obj/item/paper/pamphlet/update_icon()
	return
