//ALL SHIT FOR KIDS IN ONE FILE BECUASE I'M TIRED OF SEARCHING ALL OVER THE PLACE FOR CHILDREN SHIT

// This entire section is a MODULAR BEARHAMMER / BEARSTATION EDIT
/datum/species/human/amogus //Oh lord here we go.
	name = "Amogus"
	name_plural = "Amogus Sus"
	blurb = "Sus"
	total_health = 150
	min_age = 80
	max_age = 90
	icobase = 'icons/mob/human_races/subhuman.dmi'
	deform = 'icons/mob/human_races/subhuman.dmi'
	damage_mask = 'icons/mob/human_races/subhuman.dmi'
	blood_mask = 'icons/mob/human_races/subhuman.dmi'
	pixel_offset_y = -4
	spawn_flags = SPECIES_IS_RESTRICTED

/obj/item/clothing/under/child_jumpsuit
	name = "placeholder item"
	desc = "if you see this, tell bear immediately"
	icon_state = "child_grey"
	can_be_worn_by_child = TRUE
	child_exclusive = TRUE
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|HEAD|HANDS
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/child_shoes
	name = "placeholder item"
	desc = "if you see this, tell bear immediately"
	icon_state = "child_black"
	can_be_worn_by_child = TRUE
	child_exclusive = TRUE
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/child_heir
	name = "placeholder item"
	desc = "if you see this, tell bear immediately"
	icon_state = "heir"
	can_be_worn_by_child = TRUE
	child_exclusive = TRUE


/mob/living/carbon/human/proc/isChild()//Used to tell if someone is a child.
	if(species && species.name == "Child")
		return 1
	else
		return 0

/*
/mob/living/carbon/human/child/New(var/new_loc)
	..(new_loc, "Child")
*/