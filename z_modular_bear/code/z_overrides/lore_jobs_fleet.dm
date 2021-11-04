//sergeant, stored in astra_militarum.dm

/datum/job/sergeant
	title = "Fleet Sergeant"
	supervisors = "the Governor, the Fleet Admirality"
	total_positions = 1
	spawn_positions = 1
	selection_color = "#33813A"
	social_class = SOCIAL_CLASS_MED
	outfit_type = /decl/hierarchy/outfit/job/sergeant
	alt_titles = list(
		"Fleet Sergeant" = /decl/hierarchy/outfit/job/sergeant/catachan,
		"Vat Watchmaster" = /decl/hierarchy/outfit/job/sergeant/krieg,
		"Native Sergeant" = /decl/hierarchy/outfit/job/sergeant/valhallan
		)
	can_be_in_squad = FALSE //They have snowflake shit for squads.
	department_flag = SEC
	open_when_dead = TRUE
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory
			)
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	announced = FALSE
/datum/job/sergeant/equip(var/mob/living/carbon/human/H, alt_title)
	var/current_name = H.real_name
	..()
	H.verbs += /mob/living/carbon/human/proc/morale_boost
	H.set_trait(new/datum/trait/death_tolerant())
	H.add_stats(rand(12,17), rand(10,16), rand(10,14), rand(10,13))
	H.add_skills(rand(7,10),rand(8,10),rand(0,3),0,0)
	H.assign_random_quirk()
	H.witchblood()
	H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
	H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
	H.assign_squad_leader(IMPERIUM)
	H.warfare_faction = IMPERIUM
	if(alt_title == "Vat Watchmaster")
		var/troopnum = rand(1,50000)
		H.fully_replace_character_name("Watchmaster [troopnum]")
	else
		H.fully_replace_character_name("Sergeant [current_name]")
	to_chat(H, "<span class='notice'><b><font size=3>You are a Sergeant of the First Fleet, a proper soldier, and this job is miserable. You haven't gotten orders from the Fleet for months, the pay is nonexistant, and you're stuck with permanent riot control on a snowy, permanently-dark planet. Train the Conscripts, promote those who deserve it, defend the outpost, make sure the ore keeps flowing, and inspect those odd noises natives keep reporting. </font></b></span>")
	H.verbs += list(
	/mob/living/carbon/human/proc/khorne,
	/mob/living/carbon/human/proc/nurgle,
	/mob/living/carbon/human/proc/slaanesh,
	/mob/living/carbon/human/proc/tzeentch
	)



