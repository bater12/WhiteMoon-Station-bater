/datum/quirk/thirsty
	name = "Жажда"
	desc = "Вы начинаете чувствовать жажду в два раза быстрее. Обязательно пейте много жидкости!"
	value = -2
	gain_text = span_danger("Вы чувствуете недостаток жидкости.")
	lose_text = span_notice("Ваш водный баланс вернулся в норму")
	medical_record_text = "Организм пациента в два раза менее эффективен в плане удержания жидкости, что требует выпивания в два раза большего количества жидкости в день, чем обычно для его вида."
	mob_trait = TRAIT_THIRSTY
	hardcore_value = 1
	icon = FA_ICON_GLASS_WATER
	mail_goodies = list (
		/obj/item/reagent_containers/cup/glass/waterbottle = 1
	)


/datum/quirk/thirsty/add(client/client_source)
	// Define quirk mob
	var/mob/living/carbon/human/H = quirk_holder

	// Set hunger multiplier
	if(istype(H))
		H.physiology?.thirst_mod *= 2

/datum/quirk/thirsty/remove()
	// Define quirk mob
	var/mob/living/carbon/human/H = quirk_holder

	// Revert hunger multiplier
	if(istype(H))
		H.physiology?.thirst_mod /= 2

