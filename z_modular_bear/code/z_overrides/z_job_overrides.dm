/datum/job/undertaker //removed kids because it makes me v uncomfy.
	title = "Undertaker"
	total_positions = 0
	spawn_positions = 0
	species_role = "Astartes"

/datum/job/ig/commissar //merged with Sergeant. Might re-enable if large enough pop.
	title = "Commissar"
	supervisors = "the astartes envoy"
	total_positions = 0
	spawn_positions = 0

/datum/job/ig/medicae //was already redundant upstream
	total_positions = 0
	spawn_positions = 0

/datum/job/envoy // spessmuhreen. maybe rework/turn into some big monster-alien? that'd be neat tbh
	title = "Astartes Envoy"
	total_positions = 0
	spawn_positions = 0


// boombox for nullmind. nullmind boombox. oh yes...
/obj/item/storage/backpack/satchel/warfare/techpriest/verb/toggleboombox()
	set name = "Equip Boombox"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/device/allenwrench)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'> [usr] quickly retracts an entire boombox into their arm.</span>", "<span class='notice'>You quickly retract the boombox into your arm.</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
		if(istype(usr.r_hand, /obj/item/device/allenwrench)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] quickly retracts an entire boombox into their arm.</span>", "<span class='notice'>You quickly retract the boombox into your arm.</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the boombox.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out a boombox.")
		usr.put_in_hands(new /obj/item/device/allenwrench(usr))
		src.is_toggled = 2
