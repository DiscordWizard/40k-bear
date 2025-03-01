
/*
 * Backpack
 */

/obj/item/storage/backpack
	name = "backpack"
	desc = "You wear this on your back and put items into it."
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_backpacks.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_backpacks.dmi',
		)
	icon_state = "backpack"
	item_state = null
	//most backpacks use the default backpack state for inhand overlays
	item_state_slots = list(
		slot_l_hand_str = "backpack",
		slot_r_hand_str = "backpack",
		)
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	max_w_class = ITEM_SIZE_LARGE
	max_storage_space = 12
	var/is_satchel = FALSE //A bit hacky yeah, but satchels carry less so whatever.

/obj/item/storage/backpack/equipped()
	if(!has_extension(src, /datum/extension/appearance))
		set_extension(src, /datum/extension/appearance, /datum/extension/appearance/cardborg)
	..()

/obj/item/storage/backpack/attackby(obj/item/W as obj, mob/user as mob)
	if (src.use_sound)
		playsound(src.loc, src.use_sound, 50, 1, -5)
	return ..()

/obj/item/storage/backpack/equipped(var/mob/user, var/slot)
	if (slot == slot_back && src.use_sound)
		playsound(src.loc, src.use_sound, 50, 1, -5)
		close(user)
	..(user, slot)


/obj/item/storage/backpack/attack_hand(mob/user)
	if(src == user.back && !is_satchel)  // you have to hold backpacks, sorry my guys
		to_chat(user, "You cannot reach into \the [src] while it's on your back.")
		return
	..()


/*
 * Backpack Types
 */

/obj/item/storage/backpack/holding
	name = "bag of holding"
	desc = "A backpack that opens into a localized pocket of Blue Space."
	origin_tech = list(TECH_BLUESPACE = 4)
	icon_state = "holdingpack"
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = 56

	New()
		..()
		return

	attackby(obj/item/W as obj, mob/user as mob)
		if(istype(W, /obj/item/storage/backpack/holding))
			to_chat(user, "<span class='warning'>The Bluespace interfaces of the two devices conflict and malfunction.</span>")
			qdel(W)
			return 1
		return ..()

	//Please don't clutter the parent storage item with stupid hacks.
	can_be_inserted(obj/item/W as obj, stop_messages = 0)
		if(istype(W, /obj/item/storage/backpack/holding))
			return 1
		return ..()

/obj/item/storage/backpack/santabag
	name = "\improper Santa's gift bag"
	desc = "Space Santa uses this to deliver toys to all the nice children in space for Christmas! Wow, it's pretty big!"
	icon_state = "giftbag0"
	item_state = "giftbag"
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = 400 // can store a ton of shit!
	item_state_slots = null

/obj/item/storage/backpack/cultpack
	name = "trophy rack"
	desc = "It's useful for both carrying extra gear and proudly declaring your insanity."
	icon_state = "cultpack"

/obj/item/storage/backpack/clown
	name = "Giggles von Honkerton"
	desc = "It's a backpack made by Honk! Co."
	icon_state = "clownpack"
	item_state_slots = null

/obj/item/storage/backpack/medic
	name = "medical backpack"
	desc = "It's a backpack especially designed for use in a sterile environment."
	icon_state = "medicalpack"
	item_state_slots = null

/obj/item/storage/backpack/security
	name = "security backpack"
	desc = "It's a very robust backpack."
	icon_state = "securitypack"
	item_state_slots = null

/obj/item/storage/backpack/captain
	name = "captain's backpack"
	desc = "It's a special backpack made exclusively for officers."
	icon_state = "captainpack"
	item_state_slots = null

/obj/item/storage/backpack/industrial
	name = "industrial backpack"
	desc = "It's a tough backpack for the daily grind of industrial life."
	icon_state = "engiepack"
	item_state_slots = null

/obj/item/storage/backpack/toxins
	name = "\improper NanoTrasen backpack"
	desc = "It's a light backpack modeled for use in laboratories and other scientific institutions."
	icon_state = "ntpack"


/obj/item/storage/backpack/satchel/servitor
	name = "servitor's backpack"
	desc = "It's a special backpack made exclusively for officers."
	icon_state = "servitor_pack"
	item_state = "servitor_pack"
	canremove = 0
/obj/item/storage/backpack/hydroponics
	name = "herbalist's backpack"
	desc = "It's a green backpack with many pockets to store plants and tools in."
	icon_state = "hydpack"

/obj/item/storage/backpack/genetics
	name = "geneticist backpack"
	desc = "It's a backpack fitted with slots for diskettes and other workplace tools."
	icon_state = "genpack"

/obj/item/storage/backpack/virology
	name = "sterile backpack"
	desc = "It's a sterile backpack able to withstand different pathogens from entering its fabric."
	icon_state = "viropack"

/obj/item/storage/backpack/chemistry
	name = "chemistry backpack"
	desc = "It's an orange backpack which was designed to hold beakers, pill bottles and bottles."
	icon_state = "chempack"

/*
 * Duffle Types
 */

/obj/item/storage/backpack/dufflebag
	name = "dufflebag"
	desc = "A large dufflebag for holding extra things."
	icon_state = "duffle"
	item_state_slots = null
	w_class = ITEM_SIZE_HUGE
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 10

/obj/item/storage/backpack/dufflebag/New()
	..()
	slowdown_per_slot[slot_back] = 3
	slowdown_per_slot[slot_r_hand] = 1
	slowdown_per_slot[slot_l_hand] = 1

/obj/item/storage/backpack/dufflebag/syndie
	name = "black dufflebag"
	desc = "A large dufflebag for holding extra tactical supplies."
	icon_state = "duffle_syndie"

/obj/item/storage/backpack/dufflebag/syndie/New()
	..()
	slowdown_per_slot[slot_back] = 1

/obj/item/storage/backpack/dufflebag/syndie/med
	name = "medical dufflebag"
	desc = "A large dufflebag for holding extra tactical medical supplies."
	icon_state = "duffle_syndiemed"

/obj/item/storage/backpack/dufflebag/syndie/ammo
	name = "ammunition dufflebag"
	desc = "A large dufflebag for holding extra weapons ammunition and supplies."
	icon_state = "duffle_syndieammo"

/obj/item/storage/backpack/dufflebag/captain
	name = "captain's dufflebag"
	desc = "A large dufflebag for holding extra captainly goods."
	icon_state = "duffle_captain"

/obj/item/storage/backpack/dufflebag/med
	name = "medical dufflebag"
	desc = "A large dufflebag for holding extra medical supplies."
	icon_state = "duffle_med"

/obj/item/storage/backpack/dufflebag/sec
	name = "security dufflebag"
	desc = "A large dufflebag for holding extra security supplies and ammunition."
	icon_state = "duffle_sec"

/obj/item/storage/backpack/dufflebag/eng
	name = "industrial dufflebag"
	desc = "A large dufflebag for holding extra tools and supplies."
	icon_state = "duffle_eng"

/*
 * Satchel Types
 */

/obj/item/storage/backpack/satchel
	name = "satchel"
	desc = "A trendy looking satchel."
	icon_state = "satchel-norm"
	max_storage_space = DEFAULT_BOX_STORAGE
	slot_flags = SLOT_BACK|SLOT_S_STORE//In your back or your second back slot. Backpacks can only go in the main one though.
	is_satchel = TRUE

/obj/item/storage/backpack/satchel/warfare
	desc = "Fit for war, and not much else."
	icon_state = "warfare_satchel"

/obj/item/storage/backpack/satchel/warfare/sisterofbattle
	name = "Order of the Sacred Rose Powerpack"
	desc = "This powerpack belongs to the Knights of the Church. It bears the sigil of the Eurydale.</i>"
	icon_state = "sister"
	max_storage_space = DEFAULT_BACKPACK_STORAGE
	canremove = 0

/obj/item/storage/backpack/satchel/astartes
	name = "Fleet Mark VII Powerpack"
	desc = "A fleet marine's standard issued power armor pack."
	item_icons = list(slot_back_str = 'icons/mob/32x40/storage.dmi')
	icon_state = "ultrapack"
	item_state = "ultrapack"
	canremove = 0
	max_storage_space = DEFAULT_BACKPACK_STORAGE //backpack storage with satchel access.

/obj/item/storage/backpack/satchel/astartes/ultramarine
	name = "Fleet Mark VII Powerpack"
	desc = "A fleet marine's standard issued power armor pack. This one bears the marking of the XIIIth division, Ultramarines."
	icon_state = "ultrapack"
	item_state = "ultrapack"

/obj/item/storage/backpack/satchel/astartes/ravenguard
	name = "Fleet Mark VII Powerpack"
	desc = "A fleet marine's standard issued power armor pack. This one bears the marking of the XIXth division, Raven Guards."
	icon_state = "ravpack"
	item_state = "ravpack"

/obj/item/storage/backpack/satchel/astartes/bloodravens
	name = "Fleet Mark VII Powerpack"
	desc = A fleet marine's standard issued power armor pack. This one bears the marking of the XXVIIth division, Blood Ravens"
	icon_state = "bravpack"
	item_state = "bravpack"

/obj/item/storage/backpack/satchel/astartes/salamander
	name = "Fleet Mark VII Powerpack"
	desc = "A fleet marine's standard issued power armor pack. This one bears the marking of the XVIIIth division, Salamanders."
	icon_state = "salpack"
	item_state = "salpack"

/obj/item/storage/backpack/satchel/astartes/apothecary
	name = "Fleet Mark VII Medipack"
	desc = "A fleet marine's standard issued power armor pack. This powerpack has been upgraded with an additional spotlight and surgical arms."
	icon_state = "salpack"
	item_state = "salpack"

/obj/item/storage/backpack/satchel/warfare/techpriest/techpack //because it uses techpriest stuff.
	name = "Fleet Mark VII Servo-Harness"
	desc = "A fleet marine's standard issued power armor pack. This Powerpack has been equipped with additional Servo-Arms."
	item_icons = list(slot_back_str = 'icons/mob/32x40/storage.dmi')
	icon_state = "techpack"
	item_state = "techpack"
	max_storage_space = DEFAULT_BACKPACK_STORAGE

/obj/item/storage/backpack/satchel/warfare/kroot
	desc = "Fit for war, and not much else."
	icon_state = "krootbag"

/obj/item/storage/backpack/satchel/warfare/techpriest
	desc = "Fit for war, and not much else."
	icon_state = "warfare_satchel"
	canremove = FALSE
	var/can_toggle = 1
	var/is_toggled = 1

/obj/item/storage/backpack/satchel/warfare/techpriest/verb/toggleallen()
	set name = "Equip Allen Wrench"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/device/allenwrench)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'> [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the wrench of Saint Allen.</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
		if(istype(usr.r_hand, /obj/item/device/allenwrench)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the wrench of Saint Allen.</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the Wrench of Saint Allen.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out a Wrench of Saint Allen.")
		usr.put_in_hands(new /obj/item/device/allenwrench(usr))
		src.is_toggled = 2

/obj/item/storage/backpack/satchel/warfare/techpriest/verb/toggleoils()
	set name = "Deploy Holy Oils"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/device/holyoils)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'> [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the holy oils.</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
		if(istype(usr.r_hand, /obj/item/device/holyoils)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the holy oils.</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the holy oils")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out a container of sacred oil.")
		usr.put_in_hands(new /obj/item/device/holyoils(usr))
		src.is_toggled = 2

/obj/item/storage/backpack/satchel/warfare/techpriest/verb/togglechisel()
	set name = "Reveal Auto-Chisel"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/device/autochisel)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'> [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the auto-chisel.</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
		if(istype(usr.r_hand, /obj/item/device/autochisel)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the auto-chisel.</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the auto-chisel.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out the auto-chisel.")
		usr.put_in_hands(new /obj/item/device/autochisel(usr))
		src.is_toggled = 2

/obj/item/storage/backpack/satchel/warfare/techpriest/verb/togglecutter()
	set name = "Fire up Laser-Cutter"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/device/lasercutter)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'> [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the laser cutter.</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
		if(istype(usr.r_hand, /obj/item/device/lasercutter)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the laser cutter.</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the laser cutter.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out the laser cutter.")
		usr.put_in_hands(new /obj/item/device/lasercutter(usr))
		src.is_toggled = 2

/obj/item/storage/backpack/satchel/warfare/techpriest/biologis
	desc = "Fit for war, and not much else."
	icon_state = "warfare_satchel"
	canremove = FALSE

/obj/item/storage/backpack/satchel/warfare/techpriest/biologis/verb/toggleneural()
	set name = "Uncoil the Neural Adapter"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/device/neuraladapter)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'> [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the neural adapter!</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
		if(istype(usr.r_hand, /obj/item/device/neuraladapter)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] quickly hides an ancient tool of incredible power.</span>", "<span class='notice'>You put away the neural adapter!</span>", "<span class='warning>What was that sound?</span>")
			src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the neural adapter.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out the neural adapter.")
		usr.put_in_hands(new /obj/item/device/neuraladapter(usr))
		src.is_toggled = 2
/obj/item/storage/backpack/satchel/warfare/chestrig
	name = "Chestrig"
	desc = "Holds ammo and other goodies. But not a lot of it."
	icon_state = "chestrig"

/obj/item/storage/backpack/warfare
	desc = "Holds more than a satchel, but can't open it on your back."
	icon_state = "warfare_backpack"

/obj/item/storage/backpack/satchel/krieger
	desc = "Field ready kit, tried and tested through countless encounters."
	icon_state = "kriegpack"
	item_state = "kriegpack"

/obj/item/storage/backpack/satchel/grey
	name = "grey satchel"

/obj/item/storage/backpack/satchel/grey/withwallet
	startswith = list(/obj/item/storage/wallet/random)

/obj/item/storage/backpack/satchel/leather //brown, master type
	name = "brown leather satchel"
	desc = "A very fancy satchel made of some kind of leather."
	icon_state = "satchel"
	color = "#3d2711"

/obj/item/storage/backpack/satchel/leather/khaki
	name = "khaki leather satchel"
	color = "#baa481"

/obj/item/storage/backpack/satchel/leather/black
	name = "black leather satchel"
	color = "#212121"

/obj/item/storage/backpack/satchel/leather/navy
	name = "navy leather satchel"
	color = "#1c2133"

/obj/item/storage/backpack/satchel/leather/olive
	name = "olive leather satchel"
	color = "#544f3d"

/obj/item/storage/backpack/satchel/leather/reddish
	name = "auburn leather satchel"
	color = "#512828"

/obj/item/storage/backpack/satchel/pocketbook //black, master type
	name = "black pocketbook"
	desc = "A neat little folding clasp pocketbook with a shoulder sling."
	icon_state = "pocketbook"
	w_class = ITEM_SIZE_HUGE // to avoid recursive backpacks
	slot_flags = SLOT_BACK
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_LARGEBOX_STORAGE
	color = "#212121"

/obj/item/storage/backpack/satchel/pocketbook/brown
	name = "brown pocketbook"
	color = "#3d2711"

/obj/item/storage/backpack/satchel/pocketbook/reddish
	name = "auburn pocketbook"
	color = "#512828"

/obj/item/storage/backpack/satchel/satchel_eng
	name = "industrial satchel"
	desc = "A tough satchel with extra pockets."
	icon_state = "satchel-eng"
	item_state_slots = list(
		slot_l_hand_str = "engiepack",
		slot_r_hand_str = "engiepack",
		)

/obj/item/storage/backpack/satchel/satchel_med
	name = "medical satchel"
	desc = "A sterile satchel used in medical departments."
	icon_state = "satchel-med"
	item_state_slots = list(
		slot_l_hand_str = "medicalpack",
		slot_r_hand_str = "medicalpack",
		)

/obj/item/storage/backpack/satchel/satchel_vir
	name = "virologist satchel"
	desc = "A sterile satchel with virologist colours."
	icon_state = "satchel-vir"

/obj/item/storage/backpack/satchel/satchel_chem
	name = "chemist satchel"
	desc = "A sterile satchel with chemist colours."
	icon_state = "satchel-chem"

/obj/item/storage/backpack/satchel/satchel_gen
	name = "geneticist satchel"
	desc = "A sterile satchel with geneticist colours."
	icon_state = "satchel-gen"

/obj/item/storage/backpack/satchel/satchel_tox
	name = "\improper NanoTrasen satchel"
	desc = "Useful for holding research materials."
	icon_state = "satchel-nt"

/obj/item/storage/backpack/satchel/satchel_sec
	name = "security satchel"
	desc = "A robust satchel for security related needs."
	icon_state = "satchel-sec"
	item_state_slots = list(
		slot_l_hand_str = "securitypack",
		slot_r_hand_str = "securitypack",
		)

/obj/item/storage/backpack/satchel/satchel_hyd
	name = "hydroponics satchel"
	desc = "A green satchel for plant related work."
	icon_state = "satchel_hyd"

/obj/item/storage/backpack/satchel/satchel_cap
	name = "captain's satchel"
	desc = "An exclusive satchel for officers."
	icon_state = "satchel-cap"
	item_state_slots = list(
		slot_l_hand_str = "satchel-cap",
		slot_r_hand_str = "satchel-cap",
		)

//ERT backpacks.
/obj/item/storage/backpack/ert
	name = "emergency response team backpack"
	desc = "A spacious backpack with lots of pockets, used by members of the Emergency Response Team."
	icon_state = "ert_commander"
	item_state_slots = list(
		slot_l_hand_str = "securitypack",
		slot_r_hand_str = "securitypack",
		)

//Commander
/obj/item/storage/backpack/ert/commander
	name = "emergency response team commander backpack"
	desc = "A spacious backpack with lots of pockets, worn by the commander of an Emergency Response Team."

//Security
/obj/item/storage/backpack/ert/security
	name = "emergency response team security backpack"
	desc = "A spacious backpack with lots of pockets, worn by security members of an Emergency Response Team."
	icon_state = "ert_security"

//Engineering
/obj/item/storage/backpack/ert/engineer
	name = "emergency response team engineer backpack"
	desc = "A spacious backpack with lots of pockets, worn by engineering members of an Emergency Response Team."
	icon_state = "ert_engineering"

//Medical
/obj/item/storage/backpack/ert/medical
	name = "emergency response team medical backpack"
	desc = "A spacious backpack with lots of pockets, worn by medical members of an Emergency Response Team."
	icon_state = "ert_medical"

/*
 * Messenger Bags
 */

/obj/item/storage/backpack/messenger
	name = "messenger bag"
	desc = "A sturdy backpack worn over one shoulder."
	icon_state = "courierbag"

/obj/item/storage/backpack/messenger/chem
	name = "chemistry messenger bag"
	desc = "A serile backpack worn over one shoulder. This one is in Chemsitry colors."
	icon_state = "courierbagchem"

/obj/item/storage/backpack/messenger/med
	name = "medical messenger bag"
	desc = "A sterile backpack worn over one shoulder used in medical departments."
	icon_state = "courierbagmed"

/obj/item/storage/backpack/messenger/viro
	name = "virology messenger bag"
	desc = "A sterile backpack worn over one shoulder. This one is in Virology colors."
	icon_state = "courierbagviro"

/obj/item/storage/backpack/messenger/tox
	name = "\improper NanoTrasen messenger bag"
	desc = "A backpack worn over one shoulder. Useful for holding science materials."
	icon_state = "courierbagnt"

/obj/item/storage/backpack/messenger/com
	name = "captain's messenger bag"
	desc = "A special backpack worn over one shoulder. This one is made specifically for officers."
	icon_state = "courierbagcom"

/obj/item/storage/backpack/messenger/engi
	name = "engineering messenger bag"
	desc = "A strong backpack worn over one shoulder.This one is designed for Industrial work."
	icon_state = "courierbagengi"

/obj/item/storage/backpack/messenger/hyd
	name = "hydroponics messenger bag"
	desc = "A backpack worn over one shoulder. This one is designed for plant-related work."
	icon_state = "courierbaghyd"

/obj/item/storage/backpack/messenger/sec
	name = "security messenger bag"
	desc = "A tactical backpack worn over one shoulder. This one is in Security colors."
	icon_state = "courierbagsec"
