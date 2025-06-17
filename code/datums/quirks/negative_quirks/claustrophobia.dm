/datum/quirk/claustrophobia
	name = "Клаустрофобия"
	desc = "Вы боитесь тесных пространств. Это вызывает у вас паническую атаку."
	icon = FA_ICON_BOX_OPEN
	value = -4
	medical_record_text = "Пациент демонстрирует страх перед тесными пространствами."
	hardcore_value = 5
	quirk_flags = QUIRK_HUMAN_ONLY
	mail_goodies = list(/obj/item/reagent_containers/syringe/convermol) // to help breathing

/datum/quirk/claustrophobia/add(client/client_source)
	quirk_holder.AddComponentFrom(type, /datum/component/fearful, list(/datum/terror_handler/simple_source/claustrophobia, /datum/terror_handler/simple_source/clausophobia))

/datum/quirk/claustrophobia/remove()
	quirk_holder.RemoveComponentSource(type, /datum/component/fearful)
