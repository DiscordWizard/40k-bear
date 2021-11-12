/obj/machinery/light/stolb/rolb
	icon = 'z_modular_bear/icons/obj/lighting.dmi'
	icon_state = "rolb1"
	base_state = "rolb"
	name = "rolb"
	desc = "A light that eminates a mysterious pale blue glow. What powers it is isn't immediately apparent."
	light_type = /obj/item/light/bulb/rolb
	construct_type = /obj/machinery/light_construct/small
	idle_power_usage = 0
	active_power_usage = 0
	bound_height = 64
	bound_width = 32

/obj/item/light/bulb/rolb
	name = "rolb bulb"
	desc = "A replacement rolb bolb-... rub bu- Rob bolb. Rolbl.."
	icon_state = "fbulb"
	base_state = "fbulb"
	item_state = "egg4"
	matter = list("glass" = 100)
	brightness_range = 7
	brightness_power = 2
	brightness_color = "#3B95AB"