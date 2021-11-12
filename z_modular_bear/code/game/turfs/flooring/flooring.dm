#define ATMOSTANK_PHORON_BEAR      101



/turf/simulated/floor/dirty/sewers //use exclusively for the sewers on warhammer-1.dm
	name = "sewers" //"snowy dirt"
	desc = "Sewer water and...something, at the bottom. Smells revolting. You can barely breathe while near it, let alone submerged in it. Doesn't seem like a good idea to wade through it without a mask and oxygen."
	icon = 'icons/turf/dirt.dmi'
	icon_state = "dirt1"
	movement_delay = 5
	atom_flags = ATOM_FLAG_CLIMBABLE
	has_coldbreath = FALSE // No more freezing to death indoors.
	has_light = FALSE
	can_generate_water = FALSE
	can_be_dug = FALSE
	initial_gas = list("phoron" = ATMOSTANK_PHORON_BEAR)
	color = "green"


/turf/simulated/floor/dirty/lightsewers //use exclusively for the sewers on warhammer-1.dm
	name = "shallow sewers" //"snowy dirt"
	desc = "Sewer water and...something, at the bottom. Smells revolting. Thankfully, shallow enough to wade without too much trouble. Still disgusting, though..."
	icon = 'icons/turf/dirt.dmi'
	icon_state = "dirt1"
	movement_delay = 4
	atom_flags = ATOM_FLAG_CLIMBABLE
	has_coldbreath = FALSE // No more freezing to death indoors.
	has_light = FALSE
	can_generate_water = FALSE
	can_be_dug = FALSE


/*
/turf/simulated/floor/dirty/indestructable/mud/sewers //Unused 'til I can figure out what to do with this.
	name = "deep sewage"
	desc = "Sewer water. Looks deep. Not a good idea to step into this without a suit and oxygen."
	icon_state = "mud"
	movement_delay = 5
	atom_flags = ATOM_FLAG_CLIMBABLE
	has_coldbreath = FALSE // No more freezing to death indoors.
	has_light = FALSE
	can_generate_water = FALSE
	can_be_dug = FALSE
	initial_gas = list("phoron" = ATMOSTANK_PHORON_BEAR)
*/