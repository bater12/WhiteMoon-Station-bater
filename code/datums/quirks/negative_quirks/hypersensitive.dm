/datum/quirk/hypersensitive
	name = "Cверхчувствительный"
	desc = "Хорошо это или плохо, но, похоже, все влияет на ваше настроение больше, чем следовало бы."
	icon = FA_ICON_FLUSHED
	value = -2
	gain_text = span_danger("Кажется, вы из всего делаете большое событие.")
	lose_text = span_notice("Кажется, ты больше не придаешь всему большого значения")
	medical_record_text = "Пациент демонстрирует высокий уровень эмоциональной неустойчивости."
	hardcore_value = 3
	mail_goodies = list(/obj/effect/spawner/random/entertainment/plushie_delux)

/datum/quirk/hypersensitive/add(client/client_source)
	if (quirk_holder.mob_mood)
		quirk_holder.mob_mood.mood_modifier += 0.5

/datum/quirk/hypersensitive/remove()
	if (quirk_holder.mob_mood)
		quirk_holder.mob_mood.mood_modifier -= 0.5
