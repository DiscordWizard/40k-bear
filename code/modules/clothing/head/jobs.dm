
//Bartender
/obj/item/clothing/head/chefhat
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chefhat"
	item_state = "chefhat"


//Magistrate
/obj/item/clothing/head/crown
	name = "commandant's hat of authority"
	icon_state = "redoffcap"
	item_state = "redoffcap"
	desc = "It's good being Commandant."
	flags_inv = BLOCKHEADHAIR
	body_parts_covered = HEAD
	unacidable = TRUE //Do NOT want to lose this randomly.

//Captain
/obj/item/clothing/head/caphat
	name = "captain's hat"
	icon_state = "captain"
	desc = "It's good being the king."
	item_state_slots = list(
		slot_l_hand_str = "caphat",
		slot_r_hand_str = "caphat",
		)
	body_parts_covered = 0

//HOP
/obj/item/clothing/head/caphat/hop
	name = "crew resource's hat"
	desc = "A stylish hat that both protects you from enraged former-crewmembers and gives you a false sense of authority."
	icon_state = "hopcap"

//Chaplain
/obj/item/clothing/head/chaplain_hood
	name = "chaplain's hood"
	desc = "It's hood that covers the head. It keeps you warm during the space winters."
	icon_state = "chaplain_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Chaplain
/obj/item/clothing/head/nun_hood
	name = "nun hood"
	desc = "Maximum piety in this star system."
	icon_state = "nun_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Medical
/obj/item/clothing/head/surgery
	name = "surgical cap"
	desc = "A cap surgeons wear during operations. Keeps their hair from tickling your internal organs."
	icon_state = "surgcap"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/surgery/purple
	name = "purple surgical cap"
	color = "#7a1b3f"

/obj/item/clothing/head/surgery/blue
	name = "blue surgical cap"
	color = "#4891e1"

/obj/item/clothing/head/surgery/green
	name = "green surgical cap"
	color = "#255a3e"

/obj/item/clothing/head/surgery/black
	name = "black surgical cap"
	color = "#242424"

/obj/item/clothing/head/surgery/navyblue
	name = "navy blue surgical cap"
	color = "#1f3a69"

/obj/item/clothing/head/surgery/lilac
	name = "lilac surgical cap"
	color = "#c8a2c8"

/obj/item/clothing/head/surgery/teal
	name = "teal surgical cap"
	color = "#008080"

/obj/item/clothing/head/surgery/heliodor
	name = "heliodor surgical cap"
	color = "#aad539"

//Berets
/obj/item/clothing/head/beret
	name = "beret"
	desc = "A beret, an artists favorite headwear."
	icon_state = "beret"
	body_parts_covered = 0

/obj/item/clothing/head/beret/sec
	name = "corporate security beret"
	desc = "A beret with the security insignia emblazoned on it. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_red"

/obj/item/clothing/head/beret/sec/navy/officer
	name = "corporate security officer beret"
	desc = "A navy blue beret with an officer's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_officer"

/obj/item/clothing/head/beret/sec/navy/hos
	name = "corporate security commander beret"
	desc = "A navy blue beret with a commander's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_hos"

/obj/item/clothing/head/beret/sec/navy/warden
	name = "corporate security warden beret"
	desc = "A navy blue beret with a warden's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_warden"

/obj/item/clothing/head/beret/sec/corporate/officer
	name = "corporate security officer beret"
	desc = "A corporate black beret with an officer's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_officer"

/obj/item/clothing/head/beret/sec/corporate/hos
	name = "corporate security commander beret"
	desc = "A corporate black beret with a commander's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_hos"

/obj/item/clothing/head/beret/sec/corporate/warden
	name = "corporate security warden beret"
	desc = "A corporate black beret with a warden's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_warden"

/obj/item/clothing/head/beret/engineering
	name = "corporate engineering beret"
	desc = "A beret with the engineering insignia emblazoned on it. For engineers that are more inclined towards style than safety."
	icon_state = "beret_orange"

/obj/item/clothing/head/beret/purple
	name = "purple beret"
	desc = "A stylish, if purple, beret. For personnel that are more inclined towards style than safety."
	icon_state = "beret_purple"

/obj/item/clothing/head/beret/centcom/officer
	name = "asset protection beret"
	desc = "A navy blue beret adorned with the crest of corporate asset protection. For asset protection agents that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy"

/obj/item/clothing/head/beret/centcom/captain
	name = "asset protection command beret"
	desc = "A white beret adorned with the crest of corporate asset protection. For asset protection leaders that are more inclined towards style than safety."
	icon_state = "beret_corporate_white"

/obj/item/clothing/head/beret/deathsquad
	name = "heavy asset protection beret"
	desc = "An armored red beret adorned with the crest of corporate asset protection. Doesn't sacrifice style or safety."
	icon_state = "beret_red"
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 20, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/head/beret/guard
	name = "corporate security beret"
	desc = "A white beret adorned with the crest of NanoTrasen. For security guards that are more inclined towards style than safety."
	icon_state = "beret_corporate_whitered"

/obj/item/clothing/head/beret/plaincolor
	name = "beret"
	desc = "A simple, solid color beret. This one has no emblems or insignia on it."
	icon_state = "beret_white"

// NEW HELMETS
/obj/item/clothing/head/helmet/salvage
	name = "Reinforced Salvage Helmet"
	desc = "An old salvage helmet reinforced with metal plates."
	icon_state = "eva_rig"
	item_state = "eva_rig"
	armor = list(melee = 35, bullet = 35, laser = 25, energy = 30, bomb = 20, bio = 10, rad = 20)

/obj/item/clothing/head/helmet/mining
	name = "Reinforced Mining Helmet"
	desc = "A reinforced mining helmet designed to protect the face from blunt force trauma - particularly from falling rock and debris."
	icon_state = "rig0-ancient"
	item_state = "rig0-ancient"
	armor = list(melee = 50, bullet = 25, laser = 20, energy = 30, bomb = 30, bio = 10, rad = 30)

// Astra Militarum Stuff

/obj/item/clothing/head/helmet/guardhelmet/enforcer
	name = "Magistratum Enforcer Helmet"
	desc = "The Enforcer Helmet, based on the Cadian-pattern helmet, are issued to local planetary enforcers against criminals of the Fleet. It is painted in a dark blue colour."
	icon_state = "Jhelm2"
	item_state = "Jhelm2"
	armor = list(melee = 38, bullet = 30, laser = 20, energy = 35, bomb = 10, bio = 10, rad = 10)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/guardhelmet/enforcer/captain
	name = "Magistratum Captain Helmet"
	desc = "The Enforcer Helmet, an upgraded version of the standard Patrol helmet, are issued to local planetary enforcer Captain's both to show rank and for intimidation. It is painted in a dark blue colour."
	icon_state = "arbiter"
	item_state = "arbiter"
	armor = list(melee = 38, bullet = 44, laser = 34, energy = 35, bomb = 20, bio = 50, rad = 50)

/obj/item/clothing/head/helmet/guardhelmet
	name = "Cadian Pattern Flak Helmet"
	desc = "The most common pattern within in the Fleet, found throughout occupied space. Fleet flak helmets are cheap and easy to produce, at the cost of being nothing but a glorified bucket. This one has the Fleet's Aquila engraved on its forehead."
	icon_state = "guard"
	item_state = "guard"
	armor = list(melee = 30, bullet = 35, laser = 25, energy = 35, bomb = 30, bio = 0, rad = 10)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/medicae
	name = "Cadian Pattern Flak Helmet"
	desc = "The most common pattern within in the Fleet, found throughout occupied space. Fleet flak helmets are cheap and easy to produce, at the cost of being nothing but a glorified bucket. This one has the red Cross Emblem engraved on it forehead."
	icon_state = "medicae"
	item_state = "medicae"
	armor = list(melee = 30, bullet = 35, laser = 25, energy = 35, bomb = 30, bio = 0, rad = 10)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/krieghelmet
	name = "Krieg Mark IX Helmet"
	desc = "Unlike the more common Cadian-pattern, the Mark IX is made out of durable plasteel, giving it higher defensive capabilities though at the cost of weight and production."
	icon_state = "krieghelm"
	item_state = "krieghelm"
	armor = list(melee = 32, bullet = 32, laser = 27, energy = 35, bomb = 32, bio = 80, rad = 80)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/valushanka
	name = "Winter Regiment Ushanka"
	desc = "The Ushanka worn by the winter regiments. Smells of piss, amasec and sweat. You shouldn't touch it if you're not a fleet member."
	icon_state = "valshanka2"
	var/icon_state_up = "valshanka"
	flags_inv = HIDEEARS|BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 35, bullet = 32, laser = 25, energy = 35, bomb = 30, bio = 0, rad = 30)

/obj/item/clothing/head/valushanka/attack_self(mob/user as mob)
	if(icon_state == initial(icon_state))
		icon_state = icon_state_up
		to_chat(user, "You raise the ear flaps on the ushanka.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "You lower the ear flaps on the ushanka.")

/obj/item/clothing/head/catachan
	name = "Catachan Headband"
	desc = "The fleet's commando regiment refuses to acknowledge any sort of protection in favour of their mentality and physical capabilties. Thus, the iconic red headband goes with them anywhere they go.. But does it protect them from bullets or lasguns? No."
	icon_state = "Catachan_Headband"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 50, bullet = 10, laser = 5, energy = 35, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/commissar
	name = "Commissar's Peaked Cap"
	desc = "The fearsome and charismatic peaked cap of a Fleet Commissar, striking dread to the lowly conscripts and the ever-watching heretics."
	icon_state = "Commissar4Hat"
	item_state = "Commissar4Hat"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 15, bullet = 25, laser = 15, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/commissar/krieg
	name = "Commissar's Peaked Cap"
	desc = "The fearsome and charismatic peaked cap of a Fleet Commissar, striking dread to the lowly conscripts and the ever-watching heretics."
	icon_state = "KriegissarHat"
	item_state = "KriegissarHat"
	armor = list(melee = 15, bullet = 25, laser = 15, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/commissar/catachan
	name = "Commissar's Peaked Cap"
	desc = "The fearsome and charismatic peaked cap of a Fleet Commissar, striking dread to the lowly conscripts and the ever-watching heretics."
	icon_state = "CataCommissarHat"
	item_state = "CataCommissarHat"
	armor = list(melee = 15, bullet = 25, laser = 15, energy = 15, bomb = 10, bio = 0, rad = 0)

// Administratum Stuff

/obj/item/clothing/head/commissar/adept
	name = "Adept's Cap"
	desc = "This cap belongs to a member of the Fleet."
	icon_state = "captain_hat"
	item_state = "captain_hat"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

// The Civilian Stuff

/obj/item/clothing/head/plebhood
	name = "pleb hood"
	desc = "A disgusting hood covering a disgusting head"
	icon_state = "plebhood"
	item_state = "plebhood"
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/bardhat
	name = "bard's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "bardhat"
	item_state = "bardhat"
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/admemehat
	name = "admin's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "admeme"
	item_state = "admeme"
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/musichat
	name = "bard's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "obard"
	item_state = "obard"
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/smokingcap
	name = "smoking cap"
	desc = "A fancy smoking cap with golden tassle."
	icon_state = "smokingc"
	item_state = "smokingc"
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/pillbox
	name = "pillbox hat"
	desc = "A proper smerd hat"
	icon_state = "pillbox"
	item_state = "pillbox"
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/bighat
	name = "a big hat"
	desc = "A large, imposing hat."
	icon_state = "bighat"
	item_state = "bighat"
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/spookyhood
	name = "a spooky hood"
	desc = "A menacing hood"
	icon_state = "keeper"
	item_state = "keeper"
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/prac_cap
	name = "practioner cap"
	desc = "Wouldn't want your hair to get messy now would we."
	icon_state = "prac_cap"
	item_state = "prac_cap"
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/ushanka2
	name = "ushanka"
	desc = "A proper hat for one willing to brave the tundra."
	icon_state = "ushanka"
	item_state = "ushanka"
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 5, bullet = 15, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/scum
	name = "pimp hat"
	desc = "Pretty fly for a space guy."
	icon_state = "scum"
	item_state = "scum"

/obj/item/clothing/head/bountyhead
	name = "bounty hunter\'s helm"
	desc = "A well worn and dented helm."
	icon_state = "skullopen"
	item_state = "skullopen"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = BLOCKHAIR
	armor = list(melee = 35, bullet = 25, laser = 20, energy = 15, bomb = 10, bio = 10, rad = 15)

/obj/item/clothing/head/senturban
	name = "ornate turban"
	desc = "A turban woven from the finest of fabrics, plucked from the very depths of whatever vault your Trader may or may not have robbed. Fit for a king, or in this case a Seneschal."
	icon_state = "senturban"
	item_state = "senturban"
	cold_protection = HEAD
	flags_inv = BLOCKHEADHAIR

// Servitor Stuff

/obj/item/clothing/head/servitorhead
	name = "a servitor skull"
	desc = "A bone white skull littered with wiring and augments."
	icon_state = "servitor_helmet"
	item_state = "servitor_helmet"
	canremove = 0

/obj/item/clothing/head/servitorhead/janitor
	icon_state = "servitor_helmet2"
	item_state = "servitor_helmet2"

// The Governor Stuff

/obj/item/clothing/head/rt
	name = "noble's cap"
	desc = "A fanciful hat fitting a wealthy Noble."
	icon_state = "fancyhat"
	item_state = "fancyhat"
	armor = list(melee = 25, bullet = 25, laser = 15, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/rtpimp
	name = "noble's big cap"
	desc = "A fanciful hat fitting a wealthy Noble."
	icon_state = "rtpimp"
	item_state = "bighat"
	armor = list(melee = 25, bullet = 25, laser = 15, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/caphat/formal
	name = "parade hat"
	desc = "No one in a commanding position should be without a perfect, white hat of ultimate authority."
	icon_state = "officercap"

/obj/item/clothing/head/caphat/cap
	name = "noble's hat"
	desc = "The wonderfully fancy hat of a wealthy Noble."
	icon_state = "capcap"
	armor = list(melee = 25, bullet = 25, laser = 15, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/tradertricorn
	name = "fanciful tricorn"
	desc = " A fanciful, slightly armored, tricorn sold to the Noble by a back-alley dealer on the outpost. Legend says it was worn by the Regiment Commander of the Iron Snakes before he lost it in a battle with an ancient kraretyer, or perhaps that was just a sales pitch."
	icon_state = "tradertricorn"
	item_state = "tradertricorn"
	cold_protection = HEAD
	armor = list(melee = 10, bullet = 15, laser = 15,energy = 15)

// The Senechal Stuff

/obj/item/clothing/head/seneschal
	name = "seneschal's cap"
	desc = "This hat is the mark of the right-hand of a Noble. He handles business while the Noble is otherwise occupied."
	icon_state = "chaperon"
	item_state = "chaperon"
	armor = list(melee = 25, bullet = 25, laser = 15, energy = 15, bomb = 10, bio = 0, rad = 0)

// Inquisition Stuff

/obj/item/clothing/head/cerberus
	name = "Hound Helm"
	desc = "A helmet for the Fleet's hunting hound."
	icon_state = "cerberus"
	item_state = "cerberus"

/obj/item/clothing/head/inqhelm
	name = "Fleet Retinue Helmet"
	desc = "A helmet issued to members of the Fleet's agents."
	icon_state = "inq_helm"
	item_state = "inq_helm"
	armor = list(melee = 40, bullet = 40, laser = 35, energy = 20, bomb = 30, bio = 10, rad = 10)
	siemens_coefficient = 0.9

/obj/item/clothing/head/inqhelm/rare
	name = "Fleet Shrouded Helmet"
	desc = "A helmet issued to members of the Fleet's agents."
	icon_state = "ihhelmet"
	item_state = "ihhelmet"
	armor = list(melee = 40, bullet = 45, laser = 35, energy = 20, bomb = 30, bio = 10, rad = 10)
	siemens_coefficient = 0.9

/obj/item/clothing/head/inqhelm/stealth
	name = "Fleet Stealth Helmet"
	desc = "A helmet issued to more stealth-inclined fleet agents."
	icon_state = "stealth_rig_sealed"
	item_state = "stealth_rig_sealed"
	armor = list(melee = 25, bullet = 50, laser = 45, energy = 20, bomb = 30, bio = 10, rad = 10)
	siemens_coefficient = 0.9

/obj/item/clothing/head/ordohereticus
 	name = "Fleet Holy Hat"
 	desc = "A hat issued to zealous fleet agents."
 	icon_state = "hereticushat"
 	item_state = "hereticushat"
 	cold_protection = HEAD
 	armor = list (melee = 50, bullet = 50, laser = 40, energy = 30, bomb = 40, bio = 20, rad = 20)

// Adepta Sororitas

/obj/item/clothing/head/helmet/sisterofbattle
	name = "Order of the Sacred Rose Power Helmet"
	desc = "A helmet issued to the Knights of the Biblio's Church Militant Wing. This one bears the Sigil of Eurydale. If you looks closely, you can feel it omit holy power, making you feel safer and secure.</i>"
	icon_state = "sister"
	item_state = "sister"
	armor = list(melee = 55, bullet = 55, laser = 45, energy = 40, bomb = 40, bio = 0, rad = 0)
	species_restricted = list(SPECIES_ORK)
