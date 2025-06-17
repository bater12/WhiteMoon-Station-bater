/datum/quirk/pushover
	name = "Слабак"
	desc = "Ваш первый инстинкт всегда — позволить людям помыкать вами. Сопротивляться захватам становится заметно сложнее."
	icon = FA_ICON_HANDSHAKE
	value = -8
	mob_trait = TRAIT_GRABWEAKNESS
	gain_text = span_danger("Вы чувствуете себя слабаком.")
	lose_text = span_notice("Вы чувствуете, что можете постоять за себя..")
	medical_record_text = "Пациент демонстрирует крайне неуверенную личность и им легко манипулировать."
	hardcore_value = 4
	mail_goodies = list(/obj/item/clothing/gloves/cargo_gauntlet)
