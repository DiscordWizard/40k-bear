/obj/item/shield/buckler/custom
	name = "custom-made buckler"
	desc = "A buckler with a twist- though it's covered in wood, nearly the entire thing is made out of a surprisingly protective material that's warm to the touch. Has runes on the back-side of it. Also has a razor-sharp edge. For some reason, you feel confident enough to throw it."
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "buckler"
	color = "gray"
	slot_flags = SLOT_BACK
	force = 12
	throwforce = 25
	sharp = 1
	edge = 1
	base_block_chance = 60
	throw_speed = 10
	throw_range = 20
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 1000, "Wood" = 1000)
	attack_verb = list("slashed", "cut")

/obj/item/shield/buckler/handle_shield(mob/living/user)
	. = ..()
	if(.) playsound(user.loc, 'sound/items/buckler_block.ogg', 50, 1)

/obj/item/shield/buckler/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance


/obj/item/material/sword/cane/seolite/practice
	block_chance = 40
	force = 5
	name = "practice sword"
	desc = "A sword belonging to the Nobility. This blade is weighted perfectly in your hand. A large hilt allows for easy blocking. This one has a blunted edge. Still painful."
	sharp = 0
	edge = 0