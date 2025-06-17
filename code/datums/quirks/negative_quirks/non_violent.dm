/datum/quirk/nonviolent
	name = "Пацифист"
	desc = "Мысль о насилии делают тебе больно. Настолько, что ты не можешь причинить вред кому-либо."
	icon = FA_ICON_PEACE
	value = -8
	mob_trait = TRAIT_PACIFISM
	gain_text = span_danger("Мысль о насилии вызывает у вас отвращение!")
	lose_text = span_notice("Ты думаешь, что снова сможешь защитить себя.")
	medical_record_text = "Пациент необычайно пацифистен и не может заставить себя причинить физический вред."
	hardcore_value = 6
	mail_goodies = list(/obj/effect/spawner/random/decoration/flower, /obj/effect/spawner/random/contraband/cannabis) // flower power
