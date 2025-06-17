/datum/quirk/item_quirk/chronic_illness
	name = "Хронический синдром разрушения"
	desc = "У вас редкая болезнь, вызывающее исчезновение из реальности."
	icon = FA_ICON_DISEASE
	value = -12
	gain_text = span_danger("Вы чувствуете, как начинаете исчезать...")
	lose_text = span_notice("Вы чувствуете себя более реальным.")
	medical_record_text = "У пациента аномальное хроническое заболевание, требующее постоянного приема лекарств для контрол."
	hardcore_value = 12
	mail_goodies = list(/obj/item/storage/pill_bottle/sansufentanyl)

/datum/quirk/item_quirk/chronic_illness/add(client/client_source)
	var/datum/disease/chronic_illness/hms = new /datum/disease/chronic_illness()
	quirk_holder.ForceContractDisease(hms)

/datum/quirk/item_quirk/chronic_illness/add_unique(client/client_source)
	give_item_to_holder(/obj/item/storage/pill_bottle/sansufentanyl, list(LOCATION_BACKPACK), flavour_text = "Вам выдали лекарство, чтобы помочь контролировать ваше состояние. Принимайте его регулярно, чтобы избежать осложнений.")
	give_item_to_holder(/obj/item/healthanalyzer/simple/disease, list(LOCATION_BACKPACK))
