/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Khorne////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/khorne()
	set category = "Ruinous Powers"
	set name = "The Path of Khorne"
	set desc = "BLOOD FOR THE BLOOD GOD!"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You cannot call upon Khorne while restrained!")	//user is tied up
		return
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(src, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(src, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(src.rage)
		if(0)
			if(istype(src.l_hand, /obj/item/reagent_containers/food/snacks/khornemeat))
				qdel(usr.l_hand)
				to_chat(src, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				src.update_inv_l_hand()
				src.rage++

			else if(istype(src.r_hand, /obj/item/reagent_containers/food/snacks/khornemeat))
				qdel(usr.r_hand)
				to_chat(src, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				src.update_inv_r_hand()
				src.rage++
			else
				to_chat(src, "You feel a primal fury boiling inside of you. Two gleaming eyes stare at you from the darkness. <font color='#720202'> Kill my youngest. My weakest. Prove you are worthy. Consume their meat in front of me.</font>")
				return
		if(1)
			to_chat(src, "Strength and fury fills your muscles. A feeling begins to grow in your gut. You...you feel FUCKING INVINCIBLE!")
			STAT_LEVEL(str)+=5
			STAT_LEVEL(end)+=5
			src.rage++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/slaanesh, /mob/living/carbon/human/proc/tzeentch)
			src.mind.special_role = "Khorne Cultist"
			src.faction = "Khorne"
			src.verbs += list(/mob/living/carbon/human/proc/bludforbludguy, /mob/living/carbon/human/proc/bloodescape)
			AddInfectionImages()
		if(2)
			src.verbs += /mob/living/carbon/human/proc/khornerune
			to_chat(src, "Hatred, rage and fury like you've never known consume your mind and block out your every thought. Flashes of a symbol appear in your mind. You feel compelled to draw it.")
			src.rage++
			GLOB.khorne_cult++
		if(3)
			var/obj/effect/decal/cleanable/khorne/T = locate() in src.loc
			if(T)
				src.rage++
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "This... is it. That symbol. Just the sight of it quickens your heart and pumps adrenaline through your veins. <font color='#720202'>You can hear his voice more clearly now.</font>")
			else
				to_chat(src, "I must draw his symbol and stand upon it!")
				return

/mob/living/carbon/human/proc/bludforbludguy()
	set name = "Blood for the Blood God!"
	set category = "Ruinous Powers"
	set desc = "BLOOD FOR THE BLOOD GOD!"

	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return

	if(src.khorne_cd == 0)
		src.say("Blood for the Blood God!")
		playsound(src, 'sound/effects/khorne.ogg', 80, 0, 3)
		src.khorne_cd = 1
		sleep(100)
		src.khorne_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/bloodescape()
	set name = "Breakout!"
	set category = "Ruinous Powers"
	set desc = "These restraints can't hold you. ROAR! BREAK THEM! (WARNING: THIS IS SUPER VISIBLE.)"

	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Bear immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>")
		return
	if(!src.restrained())
		to_chat(src, "<span class='notice'>You aren't restrained!</span>")
		return
	else if((src.handcuffed) && (istype(src.handcuffed, /obj/item/handcuffs)))
		visible_message("[src] roars and breaks their restraints!")
		src.say("ALLFATHER, BREAK MY CHAINS!")
		src.handcuffed = null
		if(src.buckled && src.buckled.buckle_require_restraints)
			src.buckled.unbuckle_mob()
		src.update_inv_handcuffed()
		return