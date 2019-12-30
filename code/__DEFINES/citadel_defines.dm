//Global defines for most of the unmentionables.
//Be sure to update the min/max of these if you do change them.
//Measurements are in imperial units. Inches, feet, yards, miles. Tsp, tbsp, cups, quarts, gallons, etc

//HUD stuff
#define ui_stamina "EAST-1:28,CENTER:17" // replacing internals button
#define ui_overridden_resist "EAST-3:24,SOUTH+1:7"
#define ui_combat_toggle "EAST-4:22,SOUTH:5"

//1:1 HUD layout stuff
#define ui_boxcraft "EAST-4:22,SOUTH+1:6"
#define ui_boxarea "EAST-4:6,SOUTH+1:6"
#define ui_boxlang "EAST-5:22,SOUTH+1:6"

//Filters
#define CIT_FILTER_STAMINACRIT filter(type="drop_shadow", x=0, y=0, size=-3, color="#04080F")

//Individual logging define
#define INDIVIDUAL_LOOC_LOG "LOOC log"

#define ADMIN_MARKREAD(client) "(<a href='?_src_=holder;markedread=\ref[client]'>MARK READ</a>)"//marks an adminhelp as read and under investigation
#define ADMIN_IC(client) "(<a href='?_src_=holder;icissue=\ref[client]'>IC</a>)"//marks and adminhelp as an IC issue
#define ADMIN_REJECT(client) "(<a href='?_src_=holder;rejectadminhelp=\ref[client]'>REJT</a>)"//Rejects an adminhelp for being unclear or otherwise unhelpful. resets their adminhelp timer

//Species stuffs. Remember to change this if upstream updates species flags
#define MUTCOLORS2		35
#define MUTCOLORS3		36
#define MATRIXED		39	//if icon is color matrix'd
#define SKINTONE		40	//uses skin tones

//Citadel istypes
#define isborer(A) (istype(A, /mob/living/simple_animal/borer))

#define CITADEL_MENTOR_OOC_COLOUR "#224724"

//xenobio console upgrade stuff
#define XENOBIO_UPGRADE_MONKEYS				1
#define XENOBIO_UPGRADE_SLIMEBASIC		2
#define XENOBIO_UPGRADE_SLIMEADV			4

//stamina stuff
#define STAMINA_SOFTCRIT							100 //softcrit for stamina damage. prevents standing up, prevents performing actions that cost stamina, etc, but doesn't force a rest or stop movement
#define STAMINA_CRIT									140 //crit for stamina damage. forces a rest, and stops movement until stamina goes back to stamina softcrit
#define STAMINA_SOFTCRIT_TRADITIONAL	0	//same as STAMINA_SOFTCRIT except for the more traditional health calculations
#define STAMINA_CRIT_TRADITIONAL			-40 //ditto, but for STAMINA_CRIT
#define MIN_MELEE_STAMCOST						1.25 //Minimum cost for swinging items around. Will be extra useful when stats and skills are introduced.

#define CRAWLUNDER_DELAY							30 //Delay for crawling under a standing mob

<<<<<<< HEAD
=======
//Citadel toggles because bitflag memes
#define MEDIHOUND_SLEEPER	(1<<0)
#define EATING_NOISES		(1<<1)
#define DIGESTION_NOISES	(1<<2)
#define BREAST_ENLARGEMENT	(1<<3)
#define PENIS_ENLARGEMENT	(1<<4)
#define FORCED_FEM			(1<<5)
#define FORCED_MASC			(1<<6)
#define HYPNO				(1<<7)
#define NEVER_HYPNO			(1<<8)
#define NO_APHRO			(1<<9)
#define NO_ASS_SLAP			(1<<9)

#define TOGGLES_CITADEL (EATING_NOISES|DIGESTION_NOISES|BREAST_ENLARGEMENT|PENIS_ENLARGEMENT)

>>>>>>> 74edd7b13f... Merge pull request #10243 from Putnam3145/lewdchem-better-options
//component stuff
#define COMSIG_COMBAT_TOGGLED "combatmode_toggled" //called by combat mode toggle on all equipped items. args: (mob/user, combatmode)
