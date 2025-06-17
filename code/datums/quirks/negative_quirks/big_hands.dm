/datum/quirk/bighands
	name = "Большие кисти"
	desc = "У вас большие кисти. Это явно мешает вам пользоваться большей частью вещей."
	icon = FA_ICON_HAND_DOTS
	value = -6
	mob_trait = TRAIT_CHUNKYFINGERS
	gain_text = span_danger("Ваши кисти большие! Вы не можете использовать маленькие вещи.")
	lose_text = span_notice("Ваши кисти стали нормального размера.")
	medical_record_text = "Пациент имеет необычно большие кисти."
	hardcore_value = 5
