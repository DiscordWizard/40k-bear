/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Tzeentch//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/tzeentch()
	set category = "Ruinous Powers"
	set name = "The Path of Esker"
	set desc = "And my body that crouches in the shadow."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You cannot call upon Tzeentch while restrained!")	//user is tied up
		return
	if(rage > 0)
		to_chat(src, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(src, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	switch(src.intrigue)
		if(0)
			var/obj/structure/toilet/T = locate() in src.loc
			if(T)
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Ah-hah. You actually solved my riddle. Well, then, the game is locked in. Either you solve my riddles within the hour, and gain my power...<b> or die, and I consume your soul.</b></font>")
			else
				to_chat(src, "A voice hisses faintly. <font color='#0400ff'>Aaah...how long it has been since someone has whispered my name. Do they still worship me, up there? No, no, let's not get distracted. You came here for a...game, haven't you? Very well. Solve my riddles, and I will lend you my power...whatever of it remains. Sit upon the throne of both kings and beggars if you wish to continue.</font>")
		if(1)
			STAT_LEVEL(int) +=1
			src.intrigue++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/khorne, /mob/living/carbon/human/proc/slaanesh)
			to_chat(src, "<font color='#0400ff'>One down, eight to go!</font>")
			src.mind.special_role = "Tzeentch Cultist"
			AddInfectionImages()
			src.faction = "Tzeentch"
		if(2)
			src.verbs += /mob/living/carbon/human/proc/tzeentchrune
			to_chat(src, "<font color='#0400ff'>To hear my next riddle, memorize my symbol. Draw it and stand upon it, and speak. I will answer. Tick-tock.</font>")
			src.intrigue++
			GLOB.tzeentch_cult++
		if(3)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Good... Good! From now on I will only speak to you while you stand upon this rune... Now, for your next riddle.</font>")
			else
				to_chat(src, "I haven't drawn his symbol or I'm not standing directly on it!")
		if(4)
			var/obj/structure/closet/pit/G = locate() in src.loc
			if(G)
				src.intrigue++
				STAT_LEVEL(str)+=1
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Well done! Maybe you aren't as dim as you appear. Very well, let us continue. This next one shall reap rewards for you, little one!</font>")
			else
				to_chat(src, "<font color='#0400ff'>You'll find me in a place of stone, Where silence cloaks the ground, Search through all the empty names, And finally I'll be found.</font>")
		if(5)
			if(istype(src.l_hand, /obj/item/stack/teeth/human))
				src.intrigue++
				STAT_LEVEL(str)+=1
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>MY OH MY! I hope that isn't yours, hah! Regardless, your dedication to our game is proven. Here is your reward, little thing.</font>")

			else if(istype(src.r_hand, /obj/item/stack/teeth/human))
				src.intrigue++
				STAT_LEVEL(str)+=1
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>MY OH MY! I hope that isn't yours, hah! Regardless, your dedication to our game is proven. Here is your reward, little thing.</font>")

			else if(istype(src.l_hand, /obj/item/stack/teeth/generic))
				src.intrigue++
				STAT_LEVEL(str)+=1
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>MY OH MY! I hope that isn't yours, hah! Regardless, your dedication to our game is proven. Here is your reward, little thing.</font>")

			else if(istype(src.r_hand, /obj/item/stack/teeth/generic))
				src.intrigue++
				STAT_LEVEL(str)+=1
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>MY OH MY! I hope that isn't yours, hah! Regardless, your dedication to our game is proven. Here is your reward, little thing.</font>")
			else
				to_chat(src, "<font color='#0400ff'>I am usually white, and used for cutting and grinding. When I am damaged, humans usually remove me or fill me. For most animals, I am a useful tool. What am I?</font>")

