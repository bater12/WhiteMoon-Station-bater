/datum/round_event_control/antagonist/solo/wizard
	name = "Wizard"
	roundstart = TRUE

	antag_flag = ROLE_WIZARD
	antag_datum = /datum/antagonist/wizard

	weight = 2
	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CREW_ANTAG, TAG_HIGH)

	maximum_antags_global = 1
	min_players = 30

/datum/round_event_control/antagonist/solo/wizard/midround
	name = "Wizard Accident"
	roundstart = FALSE
	antag_flag = ROLE_WIZARD_MIDROUND
