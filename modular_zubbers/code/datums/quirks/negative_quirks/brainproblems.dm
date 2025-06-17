// Re-labels TG brainproblems to be more generic. There never was a tumor anyways!
/datum/quirk/item_quirk/brainproblems
	name = "Опухоль мозга"
	desc = "У вас смертельное заболевание мозга, которое медленно его разрушает. Лучше возьмите с собой маннитол."
	medical_record_text = "У пациента смертельно опасное заболевание мозга, которое постепенно приводит к его смерти."
	icon = FA_ICON_BRAIN

// Override of Brain Tumor quirk for robotic/synthetic species with posibrains.
// Does not appear in TGUI or the character preferences window.
/datum/quirk/item_quirk/brainproblems/synth
	name = "Каскадное разрушение позитронного мозга"
	desc = "Ваш позитронный мозг медленно разрушается из-за каскадной аномалии. Лучше принесите немного жидкого припоя!"
	gain_text = "<span class='danger'>Вы чувствуете глитчи.</span>"
	lose_text = "<span class='notice'>Вы больше не чувствуете глитчи.</span>"
	medical_record_text = "У пациента наблюдается каскадная аномалия в мозге, которая медленно приводит к смерти мозга."
	icon = FA_ICON_BRAZILIAN_REAL_SIGN
	mail_goodies = list(/obj/item/storage/pill_bottle/liquid_solder/braintumor)
	hidden_quirk = TRUE

// If brainproblems is added to a synth, this detours to the brainproblems/synth quirk.
// TODO: Add more brain-specific detours when PR #16105 is merged
/datum/quirk/item_quirk/brainproblems/add_to_holder(mob/living/new_holder, quirk_transfer = FALSE, client/client_source, unique = TRUE)
	if(!issynthetic(new_holder) || type != /datum/quirk/item_quirk/brainproblems)
		// Defer to TG brainproblems if the character isn't robotic.
		return ..()

	// TODO: Check brain type and detour to appropriate brainproblems quirk
	var/datum/quirk/item_quirk/brainproblems/synth/bp_synth = new
	qdel(src)
	return bp_synth.add_to_holder(new_holder, quirk_transfer, client_source, unique)

// Synthetics get liquid_solder with Brain Tumor instead of mannitol.
/datum/quirk/item_quirk/brainproblems/synth/add_unique(client/client_source)
	give_item_to_holder(
		/obj/item/storage/pill_bottle/liquid_solder/braintumor,
		list(
			LOCATION_LPOCKET,
			LOCATION_RPOCKET,
			LOCATION_BACKPACK,
			LOCATION_HANDS,
		),
		flavour_text = "Они сохранят вам жизнь, пока вы не сможете обеспечить себе запас лекарств. Не полагайтесь на них слишком сильно!",
	)
