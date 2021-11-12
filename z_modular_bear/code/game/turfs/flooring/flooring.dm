/turf/simulated/floor/reinforced/phoron
	initial_gas = list("phoron" = ATMOSTANK_PHORON)

/turf/simulated/floor/dirty/sewers //use exclusively for the sewers on warhammer-1.dm
	name = "sewers" //"snowy dirt"
	//icon = 'icons/turf/snow.dmi'
	//icon_state = "snow_3"
	desc = "Sewer water and...something, at the bottom. Smells revolting. You can barely breathe while near it, let alone submerged in it..."
	icon = 'icons/turf/dirt.dmi'
	icon_state = "dirt1"
	movement_delay = 0.5
	atom_flags = ATOM_FLAG_CLIMBABLE
	has_coldbreath = FALSE // No more freezing to death indoors.
	has_light = FALSE
	can_generate_water = FALSE
	can_be_dug = FALSE