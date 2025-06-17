/datum/quirk/item_quirk/fluoride_stare
	name = "Сухие глаза"
	desc = "Вы потеряли веки в ужасном несчастном случае, или так вы говорите другим. Вам нужно вручную смачивать глаза солевым раствором время от времени!"
	icon = FA_ICON_EYE_DROPPER
	value = -6
	gain_text = span_danger("Ваши глаза чешутся и становятся сухими...")
	lose_text = span_notice("Вы понимаете, что внезапная темнота, которая только что окутала вас, была всего лишь отрастанием ваших век..")
	medical_record_text = "Пациент лишился век в результате ужасного несчастного случая."
	hardcore_value = 6
	quirk_flags = QUIRK_HUMAN_ONLY
	mail_goodies = list(/obj/item/reagent_containers/cup/bottle/salglu_solution, /obj/item/light/bulb)

/datum/quirk/item_quirk/fluoride_stare/add_unique(client/client_source)
	var/obj/item/reagent_containers/cup/bottle/salglu_solution/saline = new(get_turf(quirk_holder))
	give_item_to_holder(saline, list(
		LOCATION_LPOCKET,
		LOCATION_RPOCKET,
		LOCATION_BACKPACK,
		LOCATION_HANDS,
	))
	var/obj/item/reagent_containers/dropper/dropper = new(get_turf(quirk_holder))
	give_item_to_holder(dropper, list(
		LOCATION_LPOCKET,
		LOCATION_RPOCKET,
		LOCATION_BACKPACK,
		LOCATION_HANDS,
	))

/datum/quirk/item_quirk/fluoride_stare/add(client/client_source)
	ADD_TRAIT(quirk_holder, TRAIT_NO_EYELIDS, QUIRK_TRAIT)
	quirk_holder.AddComponent(/datum/component/manual_blinking, 1, 30 SECONDS, 10 SECONDS, FALSE)

/datum/quirk/item_quirk/fluoride_stare/remove()
	REMOVE_TRAIT(quirk_holder, TRAIT_NO_EYELIDS, QUIRK_TRAIT)
	if (!HAS_TRAIT(quirk_holder, TRAIT_NO_EYELIDS))
		qdel(quirk_holder.GetComponent(/datum/component/manual_blinking))
