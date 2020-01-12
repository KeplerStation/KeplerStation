SUBSYSTEM_DEF(perfmon)
	name = "Performance Monitoring"
	wait = 60 SECONDS
	flags = SS_NO_INIT
	runlevels = RUNLEVEL_LOBBY | RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME

/datum/controller/subsystem/perfmon/fire()
	var/sql_cpu = sanitizeSQL(world.cpu)
	var/sql_id = sanitizeSQL(GLOB.round_id)
	var/datum/DBQuery/perfmon_query = SSdbcore.NewQuery("INSERT INTO [format_table_name("perflog")] (`cpu`, `round_id`) VALUES ([sql_cpu], [sql_id])")
	if(!perfmon_query.warn_execute())
		qdel(perfmon_query)
		return
	qdel(perfmon_query)
