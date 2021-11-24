/obj/item/melee/whip
	name = "whip"
	desc = "A generic whip."
	icon_state = "chain"
	item_state = "chain"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")


/obj/item/melee/whip/abyssal
	name = "abyssal whip"
	desc = "A weapon from the abyss. Requires 70 attack to wield."
	icon_state = "whip"
	item_state = "whip"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 16 //max hit with 60 strength and no equipment. Duel Arena no No forfeit - Snapshot
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")

/obj/item/melee/whip/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	icon_state = "chain"
	item_state = "whip"

/obj/item/material/sword/replica/officersword
	name = "fleet officer's sword"
	desc = "A polished sword issued to officers of the fleet."
	icon_state = "officersword"
	item_state = "officersword"
	slot_flags = SLOT_BELT
	applies_material_colour = FALSE

/obj/item/material/sword/replica/officersword/marine
	name = "marine NCO's sword"
	desc = "A polished sword issued to fleet marine NCOs."
	icon_state = "marinesword"

/obj/item/material/sword/replica/officersword/marineofficer
	name = "marine officer's sword"
	desc = "A curved sword issued to marine officers of the fleet."
	icon_state = "marineofficersword"
	item_state = "marineofficersword"

/obj/item/material/sword/replica/officersword/pettyofficer
	name = "chief petty officer's cutlass"
	desc = "A polished cutlass issued to chief petty officers of the fleet."
	icon_state = "pettyofficersword"
	item_state = "pettyofficersword"

/obj/item/material/mekmace
	name = "scrap mace"
	desc = "A mace normally used by mek boys made of scrap."
	force = 28
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "mekmace"
	item_state = "mekmace"

/obj/item/material/mekmace/afterattack(atom/target, mob/user, proximity_flag, click_parameters)

	if(istype(target, /obj/item/stack/material))
		var/obj/item/stack/material/M = target
		to_chat(user, "<span class='notice'> You start making scrap. </span>")
		if(do_after(user, 30))
			to_chat(user, "<span class='notice'> You make scrap using the [target].</span>")
			new /obj/item/stack/material/scrap(target.loc, M.amount)
			del(target)
		else
			to_chat(user, "<span class='notice'> You stop making scrap.</span>")
	. = ..()

/obj/item/melee/whip/lashoftorment //my little POGchamp pain harvester
	name = "lash of torment"
	desc = "Made up of lascivious coils and barbed hooks, a Lash of Torment moves with a mind of its own."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "lash"
	item_state = "lash"
	hitsound = 'sound/weapons/whip.ogg'
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 45 //max hit with 60 strength and no equipment. Duel Arena no No forfeit - Snapshot
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")
	var/slan = 1


/obj/item/melee/whip/lashoftorment/pickup(var/mob/living/carbon/human/user)
	if(user.lust <= 7 )
		to_chat(user, "<span class='warning'>An overwhelming feeling of dread comes over you as you pick up the [src]. It would be wise to be rid of this quickly.</span>")
		user.make_dizzy(120)
		playsound(usr, 'sound/effects/whispers1.ogg', 100, 0, -1)

// KRIEG AXE 

/obj/item/melee/trench_axe
	name = "Trench Axe"
	desc = "Used mainly for murdering those on the enemy side."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "trenchaxe"
	item_state = "trenchaxe"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 30
	block_chance = 30
	sharp = TRUE
	edge = TRUE
	hitsound = "slash_sound"
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE

// NEW MELEE

/obj/item/melee/trench_axe/runic
	name = "runic axe"
	color = "grey"
	desc = "A strange alien axe used for unknown purposes, it's construction seems ritualistic in nature."
	force = 33
	block_chance = 40

/obj/item/toy/katana/seolite
	name = "seolite blade"
	color = "grey"
	desc = "A fine blade far exceeding the craftsmanship of the fleet's engineers."
	force = 35
	throwforce = 20

/obj/item/material/sword/cane/seolite
	block_chance = 60
	force = 30
	name = "ancient rapier"
	desc = "This runic blade is of excellent quality and make, it fits perfectly in your hand."

/obj/item/material/hatchet/machete/deluxe/seolite
	name = "seolite cutter"
	desc = "A cumbersome sword used for hacking and slicing."
	force = 25
	block_chance = 40
	icon_state = "machetedx"
	item_state = "machete"

/obj/item/melee/classic_baton/daemonhammer
	name = "daemonhammer"
	desc = "A power weapon of incredible legend and stature amongst the fleet's officers, this Daemonhammer has been used by countless agents in their conflict against the unnatural beings of Biblio."
	icon_state = "thunder_hammer"
	item_state = "thunder_hammer"
	wielded_icon = "thunder_hammer-w"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	str_requirement = 13
	force = 40
	block_chance = 38
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 12

// CHAINSWORD 

/obj/item/melee/mercycs
	name = "Locke Pattern Double-Edged Chainsword"
	desc = "Nicknamed 'Mercy', This Chainsword is designed for a absolute lunatic, it comes with two ripping edges. Designed for maximum rip and tear."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "mercychainsword"
	item_state = "mercychainsword"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 12
	force = 37
	block_chance = 10
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 14

/obj/item/melee/inqcs
	name = "Drusian Pattern Chainsword"
	desc = "Nicknamed the 'Crusader', It's a common Chainsword pattern issued to fleet agents of the occupation outpost in Biblio, Designed solely to smite the mystic and rebellious."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "inqchainsword"
	item_state = "inqchainsword"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 10
	force = 35
	block_chance = 25
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 13

/obj/item/melee/pcsword
	name = "Mark I Pattern Chainsword"
	desc = "The standard issued chainsword of the fleet since anyone can remember, Forged by the finest weaponsmiths, these Chainswords have seen the test of time."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "pcsword"
	item_state = "pcsword"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 14
	force = 38
	block_chance = 35
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 11

/obj/item/melee/pcsword/eviscerator
	name = "Eviscerator Pattern Chainsword"
	desc = "Favoured both by the Church of Biblio and fleet agents, it's an absurdly large, two-handed chainsword, equipped with a crude disruption field found commonly on power weapons. Though extremely unwieldly, it is a powerful sword, and in the hands of a skilled warrior it truly shines on the battlefield."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "eviscerator"
	item_state = "eviscerator"
	wielded_icon ="eviscerator"
	str_requirement = 12
	force = 25// it's unwieldy when you don't use two hands, baby sword.
	force_wielded = 42
	block_chance = 25
	sharp = 1
	edge = 1
	w_class = ITEM_SIZE_HUGE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	attack_verb = list("attacked", "sawed", "cleaved", "torn", "cut")
	weapon_speed_delay = 16
