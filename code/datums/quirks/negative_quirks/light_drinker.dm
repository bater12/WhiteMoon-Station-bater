/datum/quirk/light_drinker
	name = "Легко пьянеющий"
	desc = "Вы просто не можете справиться со своими напитками и очень быстро пьянеете.."
	icon = FA_ICON_COCKTAIL
	value = -2
	mob_trait = TRAIT_LIGHT_DRINKER
	gain_text = span_notice("Одна только мысль об употреблении алкоголя кружит голову.")
	lose_text = span_danger("Вы больше не находитесь под сильным влиянием алкоголя.")
	medical_record_text = "Пациент демонстрирует низкую толерантность к алкоголю."
	hardcore_value = 3
	mail_goodies = list(/obj/item/reagent_containers/cup/glass/waterbottle)
