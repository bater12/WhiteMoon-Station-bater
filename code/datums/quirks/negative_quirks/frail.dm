/datum/quirk/frail
	name = "Хрупкий"
	desc = "У вас кожа из бумаги, а кости из стекла. Получить травму гораздо легче."
	icon = FA_ICON_SKULL
	value = -6
	mob_trait = TRAIT_EASILY_WOUNDED
	gain_text = span_danger("Вы чувствуете хрупкость.")
	lose_text = span_notice("Вы чувствуете что ваше тело снова стало крепче.")
	medical_record_text = "Пациента абсурдно легко травмировать. Пожалуйста, проявите всю должную осмотрительность, чтобы избежать возможных исков о врачебной ошибке."
	hardcore_value = 4
	mail_goodies = list(/obj/effect/spawner/random/medical/minor_healing)
