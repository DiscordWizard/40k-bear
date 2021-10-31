//oh god this may cock things up terribly in the future...maybe comment out originals in pilgrims.dm before turning this on? concenr is double-spawns because of equip var
//  either way, make sure all of ihe lore descriptions are done before you make huge comments/uncomments, because this is for lore overwrites, and you better be sure about that fucking lore

/datum/job/innkeeper
	title = "Innkeeper"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "Money"
	selection_color = "#848484"
	access = list(access_bar,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/innkeeper
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(9,12), rand(7,12), rand(8,12), rand (8,11))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.assign_random_quirk()
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are, or were, a civillain contractor of the First Fleet. .</font></b></span>")


// PILGRIM. TODO: oh

/datum/job/penitent
	title = "Villager"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN
	total_positions = INFINITY
	spawn_positions = INFINITY
	supervisors = "the House and the Fleet"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE
	announced = FALSE


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.assign_random_quirk()
		H.witchblood()
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a native of Biblio, one of the few that survived the twelve-hour Conflict between your world and the First Fleet. Go to your pilgrim tab and select your fate. </font></b></span>")



		H.verbs += list(
			/mob/living/carbon/human/proc/penitentclass,
		)
/*
Pilgrim Fate System
*/

//yeah this might be the most retarded way of doing it but it works - plz no bully Matt

//mob/living/carbon/human/proc/penitentclass(var/mob/living/carbon/human/M)
/mob/living/carbon/human/proc/penitentclass()
	set name = "Select your class"
	set category = "Pilgrim"
	set desc = "Choose your new profession on this strange world."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	src.verbs -= list(/mob/living/carbon/human/proc/penitentclass)

	var/mob/living/carbon/human/U = src
	var/fates = list() //lists all possible fates

	fates += pick("Merchant","Bounty Hunter","Penitent",) //adds a fate randomly to essentially give rng pick
	fates += pick("Sherpa","Musician","Unlicensed Physician",) //adds a fate randomly to essentially give rng pick
	fates += pick("Stalker","Scum","Miner",) //adds a fate randomly to essentially give rng pick

	mind.store_memory("[fates]") //should stop people from closing client and rerolling fates


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)
		if("Sherpa")
			equip_to_slot_or_del(new /obj/item/clothing/suit/sherpa, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/ushanka2, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_belt)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'>You were a laborer before the Conflict. You were, and still are, one of the lucky ones- after your old government's defeat, you were re-employed by the House Nobility, the small rag-tag power that survived the invasion. You didn't get the land the Fleet stole back, but...at least you can, theoretically, get paid.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Penitent")
			equip_to_slot_or_del(new /obj/item/clothing/suit/raggedrobe, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/plebhood, slot_head)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/ten, slot_r_store)
			to_chat(U, "<span class='notice'><b><font size=3>You are a penitent, forced to tour the galaxy and toil until death in hopes of one day redeeming yourself. In your youth, you were an unknowing daemon-worshipper. Years of torment and re-education by the Inquisition allowed you this one chance at redemption. Labour endlessly in His name.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Bounty Hunter")
			U.add_stats(rand(10,14), rand(10,14), rand(10,14), rand (8,12)) //veteran hunter
			U.add_skills(rand(5,8),rand(5,8),rand(1,3),0,0)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/bountyhunter2, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/bountyhead, slot_head)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/lasgun, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/handcuffs, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>You're one of the few crazy enough to toe the line between civillian and criminal in the Fleet's eyes. Your entire life is a tightrope act; you need to put food on the table by cashing in bounties with the Fleet or Nobility, but you need to make sure nobody quite sees how you do it, lest they charge you for disturbing the peace, .</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Merchant")
			equip_to_slot_or_del(new /obj/item/clothing/head/smokingcap, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/merchant, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'>You're a merchant under the employ of the House Nobility, and it's not the type of employment you can exactly quit. Stuck between being extorted by the House, and taxed by the Fleet, you've struggled to make ends meet. Work with the village and the outpost to organize trade and enrich yourself.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Musician")
			equip_to_slot_or_del(new /obj/item/device/violin, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/suit/musician, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/musichat, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)

			to_chat(U,"<span class='notice'><b><font size=3>A wandering bard, you find yourself moving from tavern to tavern entertaining the masses for a few coins a time. ...Good luck with that one, buddy. </font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Miner")
			U.add_stats(rand(10,13),rand(8,12),rand(10,12),8)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick, slot_gloves)
			equip_to_slot_or_del(new /obj/item/storage/newore, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/satchel_eng, slot_back)
			equip_to_slot_or_del(new /obj/item/pickaxe/newpick, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/suit/miner, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>You're a laborer directly employed by the House Nobility. You get access to their outpost at the northwest corner of the town. It's dangerous work, but...hey, at least you can cook whatever's trying to kill you down there, right...?.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Stalker")
			U.add_skills(rand(1,3),rand(5,8),0,0,0)
			equip_to_slot_or_del(new /obj/item/storage/belt/stalker, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/material/knife/butch, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/suit/chokha, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/head/pillbox, slot_head)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			to_chat(U,"<span class='notice'><b><font size=3>You're a hunter that captures or kills game, and either brings it back to town to sell or use it to feed yourself.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Scum")
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/scum, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/scum, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/happy, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/happy, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/zoom, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/flame/lighter/zippo, slot_l_store)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			to_chat(U,"<span class='notice'><b><font size=3>Always on the run, always moving from scheme to scheme. You'll do whatever it takes for a coin or two. Scamming, gambling, drug dealing...though your businesses have become more lucrative under the Fleet's restrictive new laws and the chaos the Conflict caused.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Unlicensed Physician")
			U.add_skills(0,0,rand(5,9),0,rand(5,9))
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/prac_mask, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/suit/prac_arpon, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/full, slot_belt)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/prac_gloves, slot_gloves)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>The only 'licensed' physicians are the one the Fleet approves. Maybe you're native, maybe you're one of the many doctors that are stuck in beuracratic hell waiting for a license. Set up shop on this new world and hope no one asks to see your credentials.</font></b></span>")
			var/obj/item/card/id/ring/disgracedmedicae/W = new

			W.icon_state = "medicae_ring"
			W.assignment = "Medicae"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)


// Rogue Trader

var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Fleet Governor"
	department = "Rogue Trader"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "Fleet Command or the Admiral, wherever they are"
	selection_color = "#011c77"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 25
	economic_modifier = 20
	announced = FALSE
	latejoin_at_spawnpoints = TRUE

	ideal_character_age = 60
	outfit_type = /decl/hierarchy/outfit/job/captain
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 5
	ranged_skill = 6
	medical_skill = 4
	engineering_skill = 3
	surgery_skill = 2

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Governor [current_name]")
		H.add_stats(rand(12,18), rand(12,18), rand(12,18), rand(12,18))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(/mob/living/carbon/human/proc/hire,)
		to_chat(H, "<span class='notice'><b><font size=3>You are an administrator-governor, and have been assigned to preside over this world while the First Fleet continues its two-century-long offensive across the galaxy. Messages from the Fleet come rarely, and even rarer still are resupplies. You aren't entirely alone- you have a small group of local recruits with dubious loyalties and, maybe, one or two good men. Keep your outpost functioning until the Fleet returns- if it ever does. </font></b></span>")

