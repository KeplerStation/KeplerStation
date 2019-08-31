/datum/tgs_chat_command/wheelofsalt
	name = "wheelofsalt"
	help_text = "What are the players salting about today? Spin the wheel and find out!"

/datum/tgs_chat_command/wheelofsalt/Run(datum/tgs_chat_user/sender, params)
	var/saltresult = "The wheel of salt [pick("clatters","screams","vibrates","clanks","resonates","groans","moans","squeaks","emits a[pick(" god-forsaken"," creepy"," generic"," demonic")] [pick("airhorn","bike horn","trumpet","clown","dog","laughing")] noise")] as it spins violently... And it seems the salt of the day is the "
	var/saltprimarysubject = "[pick("combat","medical","grab","wall","cat","lizard","dog","vision cone","atmospherics","table","chem","rework","sleeper","door wires","flightsuit","coder privilege","Developer abuse","ban reason","github self merge","red panda","beret","powergame","hexacrocin","Discord server","Cargonia","Solarian Republic","bluespace","salt","chem dispenser theft","Botany","moth","BWOINK","stamina","Mason Jakops","mining","noodle","Lavaland","Necropolis","Ashwalker","chaplain","Antag","nanite","Syndicate","Nar-Sie","Ratvar","Cult","maint","Foam-Force","AI","cyborg","ghost","clockwork","cyberpunk","vaporwave","Clown","Mime","security","research","Megafauna","Bubblegum","Ash Drake","Legion","Colossus","White Shuttle","Changeling","Cowboy","Space Ninja","Poly","Revolutionary","Skyrim","forbidden fruits","xenomorph","blob","Nuclear Operative","crossdressing")]"
	var/saltsecondarysubject = "[pick("rework","changes","ban","removal","addition","leak","proposal","fanart","introduction","tabling","crossdressing","sprites","argument","theft","nerf","screeching","salt","murder","replacement","ship","netflix adaptation","dance","remaster","system","voyeur","decoration","pre-order")]"
	if(prob(10))
		saltresult += "@here for your salt, all day every day"
		if(prob(1))
			saltresult += " @everyone gets some salt this time too"
	else
		saltresult += "[saltprimarysubject] [saltsecondarysubject]"
	return "[saltresult]!"

/datum/tgs_chat_command/despacito
	name = "despacito"			//someone please high effort this sometime and make it a full on ytdl search
	help_text = "This is so sad."

/datum/tgs_chat_command/despacito/Run()
	return "https://www.youtube.com/watch?v=kJQP7kiw5Fk"
