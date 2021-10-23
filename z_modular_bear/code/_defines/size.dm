// FURRY CODE HERE - micro/macro shit here

#define isTaurTail(A)	istype(A, /datum/sprite_accessory/tail/taur) //pain in the ass to sort this properly so im dumping this crap here

//these aren't defines so they can stay in this file
var/const/RESIZE_HUGE = 1.2
var/const/RESIZE_BIG = 1.1
var/const/RESIZE_NORMAL = 1
var/const/RESIZE_SMALL = 0.9
var/const/RESIZE_TINY = 0.8
//Eclipse edits ^^^^ Size
//average
var/const/RESIZE_A_HUGEBIG = (RESIZE_HUGE + RESIZE_BIG) / 2
var/const/RESIZE_A_BIGNORMAL = (RESIZE_BIG + RESIZE_NORMAL) / 2
var/const/RESIZE_A_NORMALSMALL = (RESIZE_NORMAL + RESIZE_SMALL) / 2
var/const/RESIZE_A_SMALLTINY = (RESIZE_SMALL + RESIZE_TINY) / 2

// Adding needed defines to /mob/living
// Note: Polaris had this on /mob/living/carbon/human We need it higher up for animals and stuff.
/mob/living
	var/size_multiplier = 1 //multiplier for the mob's icon size
	var/holder_default

// Define holder_type on types we want to be scoop-able
/*/mob/living/carbon/human
	holder_type = /obj/item/weapon/holder/micro
*/
// The reverse lookup of player_sizes_list, number to name.
/proc/player_size_name(var/size_multiplier)
	// (This assumes list is sorted big->small)
	for(var/N in player_sizes_list)
		. = N // So we return the smallest if we get to the end
		if(size_multiplier >= player_sizes_list[N])
			return N

/**
 * Scale up the size of a mob's icon by the size_multiplier.
 * NOTE: mob/living/carbon/human/update_icons() has a more complicated system and
 * 	is already applying this transform.   BUT, it does not call ..()
 *	as long as that is true, we should be fine.  If that changes we need to
 *	re-evaluate.
 */
/mob/living/update_icons()
	. = ..()
	var/matrix/M = matrix()
	M.Scale(size_multiplier)
	M.Translate(0, 16*(size_multiplier-1))
	src.transform = M

/**
 * Get the effective size of a mob.
 * Currently this is based only on size_multiplier for micro/macro stuff,
 * but in the future we may also incorporate the "mob_size", so that
 * a macro mouse is still only effectively "normal" or a micro dragon is still large etc.
 */
/mob/proc/get_effective_size()
	return 100000 //Whatever it is, it's too big to pick up, or it's a ghost, or something.

/mob/living/get_effective_size()
	return src.size_multiplier

//stuffed in here because interbay doesn't have it
/mob/living/proc/update_transform()
	// First, get the correct size.
	var/desired_scale = size_multiplier

	// Now for the regular stuff.
	var/matrix/M = matrix()
	M.Scale(desired_scale)
	M.Translate(0, 16*(desired_scale-1))
	src.transform = M

/**
 * Resizes the mob immediately to the desired mod, animating it growing/shrinking.
 * It can be used by anything that calls it.
 */
/mob/living/proc/resize(var/new_size)
	if(size_multiplier == new_size)
		return 1

	size_multiplier = new_size //Change size_multiplier so that other items can interact with them
	update_transform()


// Optimize mannequins - never a point to animating or doing HUDs on these.
/mob/living/carbon/human/dummy/mannequin/resize(var/new_size, var/animate = TRUE)
	size_multiplier = new_size

/**
 * Verb proc for a command that lets players change their size OOCly.
 * Ace was here! Redid this a little so we'd use math for shrinking characters. This is the old code.
 */


/mob/living/proc/set_size()
	set name = "Adjust Mass"
	set category = "Abilities" //Seeing as prometheans have an IC reason to be changing mass.

	var/nagmessage = "Adjust your mass to be a size between 80% and 120% (DO NOT ABUSE)"
	var/new_size = input(nagmessage, "Pick a Size") as num|null
	if(new_size && IsInRange(new_size, 80, 120))
		src.resize(new_size/100)
		message_admins("[key_name(src)] used the resize command in-game to be [new_size]% size. \
			([src ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[src.x];Y=[src.y];Z=[src.z]'>JMP</a>" : "null"])")
