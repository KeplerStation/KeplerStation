/datum/controller/subsystem/mapping/proc/load_vr_level()
	var/start_time = REALTIMEOFDAY
	var/datum/map_template/template = pick(subtypesof(/datum/map_template/vr))
	load_new_z_level(initial(template.mappath), "VR Level") // initial() MUST be used here because BYOND is fucking GARBAGE
	INIT_ANNOUNCE("Loaded VR Level in [(REALTIMEOFDAY - start_time)/10]s!")
