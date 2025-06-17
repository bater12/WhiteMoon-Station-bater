/datum/quirk/cursed
	name = "Проклятый"
	desc = "Вы прокляты... Фортуна вас покинула. Опасайтесь несчастных случаев."
	icon = FA_ICON_CLOUD_SHOWERS_HEAVY
	value = -8
	mob_trait = TRAIT_CURSED
	gain_text = span_danger("Вы чувствуете что сегодня не ваш день.")
	lose_text = span_notice("Вы чувствуете что сегодня вам снова улыбается удача.")
	medical_record_text = "Пациент проклят."
	hardcore_value = 8

/datum/quirk/cursed/add(client/client_source)
	quirk_holder.AddComponent(/datum/component/omen/quirk)
