// this is going to be shitcode, i'm so sorry.

/obj/item/thrones/ewallet/preloaded/peasant
	worth = 50

/obj/item/thrones/ewallet/preloaded/poor
	worth = 75

/obj/item/thrones/ewallet/preloaded/worker
	worth = 100

/obj/item/thrones/ewallet/preloaded/wealthy
	worth = 125

/obj/item/thrones/ewallet/preloaded/richmon //governor, attendant
	worth = 1000


/obj/machinery/vending/containers
	name = "FleetStar Conversion"
	desc = "A machine that converts the local coin currency into credits one can use in Fleet vending machines. The pricing is predatory, to say the least. Only accepts increments of ten coins at a time."
	icon_state = "robotics"

/obj/machinery/vending/containers/attackby(obj/item/W as obj, mob/user as mob)

	var/obj/item/card/id/I = W.GetIdCard()

	if (currently_vending && vendor_account && !vendor_account.suspended)
		var/paid = 0
		var/handled = 0

		//if (I) //for IDs and PDAs and wallets with IDs
		//	paid = pay_with_card(I,W)
		//	handled = 1
		if (istype(W, /obj/item/thrones/ewallet)) //this works. the plan is to make a vendor that converts thrones to charge-card
			var/obj/item/thrones/ewallet/C = W
			paid = pay_with_ewallet(C)
			handled = 1
		else if (istype(W, /obj/item/thrones))
			var/obj/item/stack/thrones/C = W
			paid = pay_with_cash(C)
			handled = 1

