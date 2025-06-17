/datum/quirk/unstable
	name = "Нестабильный"
	desc = "Из-за прошлых проблем вы не сможете восстановить свой рассудок, если потеряете его. Будьте очень осторожны, управляя своим настроением!"
	icon = FA_ICON_ANGRY
	value = -10
	mob_trait = TRAIT_UNSTABLE
	gain_text = span_danger("Сейчас у вас много мыслей.")
	lose_text = span_notice("Ваш разум наконец-то успокоился.")
	medical_record_text = "Психика пациента находится в уязвимом состоянии и не может оправиться от травматических событий."
	hardcore_value = 9
	mail_goodies = list(/obj/effect/spawner/random/entertainment/plushie)
