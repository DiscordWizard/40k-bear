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
	set name = "Deploy Emergency Boombox"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"Can't deploy funky beats right now.")
		return
	if(src.is_toggled == 2) //this section is unused for rn
		if(istype(usr.l_hand, /obj/item/device/boombox)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'> [usr] quickly retracts an entire boombox into their arm.</span>", "<span class='notice'>You quickly retract the boombox into your arm.</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
		if(istype(usr.r_hand, /obj/item/device/boombox)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] quickly retracts an entire boombox into their arm.</span>", "<span class='notice'>You quickly retract the boombox into your arm.</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the boombox.")
		src.is_toggled = 1
	else
		to_chat(usr,"You deploy your emergency boombox succesfully. Loading groove subsystems.")
		visible_message("<span class='warning'> [usr] suddenly withdraws a boombox from...somewhere..</span>","<span class='notice'>You quickly deploy your emergency boombox, ready to lay down sick beats.</span>", "<span class='warning>What was that sound?</span>")
		usr.put_in_hands(new /obj/item/device/boombox(usr))
		src.is_toggled = 2
		src.verbs -= list(/obj/item/storage/backpack/satchel/warfare/techpriest/verb/toggleboombox)