//Moved (most) bounties requiring botany to gardencook.dm Roundstart cook bounties go here.

/datum/bounty/item/chef/soup
	name = "Soup"
<<<<<<< HEAD
	description = "To quell the homeless uprising, the ICC will be serving soup to all underpaid workers. Ship any type of soup."
	reward = 700
	required_count = 3
=======
	description = "To quell the homeless uprising, Nanotrasen will be serving soup to all underpaid workers. Ship any type of soup. Do NOT ship bowls of water."
	reward = 1200
	required_count = 4
>>>>>>> 86a3a5dd4d... Merge pull request #10610 from Owai-Seek/bountytweaks
	wanted_types = list(/obj/item/reagent_containers/food/snacks/soup)
	exclude_types = list(/obj/item/reagent_containers/food/snacks/soup/wish)

/datum/bounty/item/chef/icecreamsandwich
	name = "Ice Cream Sandwiches"
	description = "Upper management has been screaming non-stop for ice cream. Please send some."
	reward = 1200
	required_count = 5
	wanted_types = list(/obj/item/reagent_containers/food/snacks/icecreamsandwich)

/datum/bounty/item/chef/bread
	name = "Bread"
	description = "Problems with central planning have led to bread prices skyrocketing. Ship some bread to ease tensions."
	reward = 1000
	wanted_types = list(/obj/item/reagent_containers/food/snacks/store/bread, /obj/item/reagent_containers/food/snacks/breadslice, /obj/item/reagent_containers/food/snacks/bun, /obj/item/reagent_containers/food/snacks/pizzabread, /obj/item/reagent_containers/food/snacks/rawpastrybase)

/datum/bounty/item/chef/pie
	name = "Pie"
	description = "3.14159? No! Head Office wants edible pie! Ship a whole one."
	reward = 3142
	wanted_types = list(/obj/item/reagent_containers/food/snacks/pie)

/datum/bounty/item/gardencook/khinkali
	name = "Khinkali"
	description = "Requesting -some khinki stuff- for a private staff party at Centcom."
	reward = 2400
	required_count = 6
	wanted_types = list(/obj/item/reagent_containers/food/snacks/khinkali)

/datum/bounty/item/chef/salad
	name = "Salad or Rice Bowls"
	description = "Head Office is going on a health binge. Your order is to ship salad or rice bowls."
	reward = 1200
	required_count = 3
	wanted_types = list(/obj/item/reagent_containers/food/snacks/salad)

<<<<<<< HEAD
/datum/bounty/item/chef/superbite
	name = "Super Bite Burger"
	description = "Commander Tubbs thinks he can set a competitive eating world record. All he needs is a super bite burger shipped to him."
	reward = 1800
	wanted_types = list(/obj/item/reagent_containers/food/snacks/burger/superbite)

/datum/bounty/item/chef/poppypretzel
	name = "Poppy Pretzel"
	description = "Head Office needs a reason to fire their HR head. Send over a poppy pretzel to force a failed drug test."
	reward = 3000
	wanted_types = list(/obj/item/reagent_containers/food/snacks/poppypretzel)

=======
>>>>>>> 86a3a5dd4d... Merge pull request #10610 from Owai-Seek/bountytweaks
// /datum/bounty/item/chef/cubancarp
// 	name = "Cuban Carp"
// 	description = "To celebrate the birth of Castro XXVII, ship one cuban carp to Head Office."
// 	reward = 3000
// 	wanted_types = list(/obj/item/reagent_containers/food/snacks/cubancarp)

/datum/bounty/item/chef/hotdog
	name = "Hot Dog"
	description = "Head Office is conducting taste tests to determine the best hot dog recipe. Ship your station's version to participate."
	reward = 4000
	wanted_types = list(/obj/item/reagent_containers/food/snacks/hotdog)

/datum/bounty/item/chef/muffin
	name = "Muffins"
	description = "The Muffin Man is visiting Head Office, but he's forgotten his muffins! Your order is to rectify this."
	reward = 3000
	required_count = 3
	wanted_types = list(/obj/item/reagent_containers/food/snacks/muffin)

/datum/bounty/item/chef/chawanmushi
	name = "Chawanmushi"
	description = "Head Office wants to improve relations with a local cat. Ship Chawanmushi immediately."
	reward = 5000
	wanted_types = list(/obj/item/reagent_containers/food/snacks/chawanmushi)

/datum/bounty/item/chef/kebab
	name = "Kebabs"
	description = "Remove all kebab from station you are best food. Ship to Head Office to remove from the premises."
	reward = 1500
	required_count = 3
	wanted_types = list(/obj/item/reagent_containers/food/snacks/kebab)

/datum/bounty/item/chef/soylentgreen
	name = "Soylent Green"
	description = "The ICC has heard wonderful things about the product 'Soylent Green', and would love to try some. If you endulge them, expect a pleasant bonus."
	reward = 4000
	wanted_types = list(/obj/item/reagent_containers/food/snacks/soylentgreen)

/datum/bounty/item/chef/pancakes
	name = "Pancakes"
	description = "Here at Horizons we consider employees to be family. And you know what families love? Pancakes. Ship a baker's dozen."
	reward = 4000
	required_count = 13
	wanted_types = list(/datum/crafting_recipe/food/pancakes)

/datum/bounty/item/chef/nuggies
	name = "Chicken Nuggets"
	description = "The vice president's son won't shut up about chicken nuggies. Would you mind shipping some?"
	reward = 2500
	required_count = 6
	wanted_types = list(/obj/item/reagent_containers/food/snacks/nugget)

/datum/bounty/item/chef/khachapuri
	name = "Khachapuri"
	description = "Bread and eggs. Bread and eggs. Bread and eggs. Also, cheese."
	reward = 2000
	required_count = 2
	wanted_types = list(/obj/item/reagent_containers/food/snacks/khachapuri)

///datum/bounty/item/chef/ratkebab
//	name = "Rat Kebabs"
//	description = "Centcom is requesting some -special- kebabs for it's service staff."
//	reward = 1800
//	required_count = 3
//	wanted_types = list(/obj/item/reagent_containers/food/snacks/kebab/rat)

/datum/bounty/item/chef/benedict
	name = "Eggs Benedict"
	description = "We're honouring a visiting religious dignitary. He's very particular about names. Ship it right away."
	reward = 1750
	wanted_types = list(/obj/item/reagent_containers/food/snacks/benedict)

/datum/bounty/item/chef/braincake
	name = "Brain Cake"
	description = "The ICC requires a brain cake for testing purposes. Don't ask."
	reward = 1200
	wanted_types = list(/obj/item/reagent_containers/food/snacks/store/cake/brain)

/datum/bounty/item/chef/waffles
	name = "Waffles"
	description = "The ICC is holding their annual business mixer. Ship some waffles so we can impress the bigwigs."
	reward = 1000
	wanted_types = list(/obj/item/reagent_containers/food/snacks/waffles)

/datum/bounty/item/chef/sugarcookie
	name = "Sugar Cookies"
	description = "Everyone needs a little sugar in their life. Ship some sweets to Head Office."
	reward = 1200
	required_count = 6
	wanted_types = list(/obj/item/reagent_containers/food/snacks/sugarcookie)

/datum/bounty/item/chef/bbqribs
	description = "There's a debate around command as to weather or not ribs should be considered finger food, and we need a few delicious racks to process."
	reward = 2250
	required_count = 3
	wanted_types = list(/obj/item/reagent_containers/food/snacks/bbqribs)