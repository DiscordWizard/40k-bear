//ALL SHIT FOR KIDS IN ONE FILE BECUASE I'M TIRED OF SEARCHING ALL OVER THE PLACE FOR CHILDREN SHIT

// This entire section is a MODULAR BEARHAMMER / BEARSTATION EDIT
/datum/species/human/children //Oh lord here we go.
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

/*
/datum/species/human/child/handle_post_spawn(var/mob/living/carbon/human/H)
	//H.mutations.Add(CLUMSY)//So kids don't go around being commandos.
	H.age = rand(min_age,max_age)//Random age for kiddos.
	if(H.f_style)//Children don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<span class='info'><big>You're [H.age] years old! Act like it!</big></span>")
	to_chat(H, "<big><span class='warning'>CHILDREN ARE CLUMSY AND CANNOT USE GUNS OR MELEE WEAPONS! DOING SO WILL KILL YOU!</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
*/

/obj/item/clothing/under/child_jumpsuit
	name = "grey children's jumpsuit"
	desc = "Fitted just for kids."
	icon_state = "child_grey"
	can_be_worn_by_child = TRUE
	child_exclusive = TRUE
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|HEAD|HANDS
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/child_shoes
	name = "black children's shoes"
	desc = "Shoes for the little ones."
	icon_state = "child_black"
	can_be_worn_by_child = TRUE
	child_exclusive = TRUE
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/child_heir
	name = "heir's clothing"
	desc = "For underaged ruling in fashion."
	icon_state = "heir"
	can_be_worn_by_child = TRUE
	child_exclusive = TRUE


/mob/living/carbon/human/proc/isChild()//Used to tell if someone is a child.
	if(species && species.name == "Child")
		return 1
	else
		return 0

/mob/living/carbon/human/child/New(var/new_loc)
	..(new_loc, "Child")