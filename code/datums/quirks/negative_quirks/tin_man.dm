/datum/quirk/tin_man
	name = "Железный Дровосек"
	desc = "Из-за какого-то поистине жестокого космического наказания большинство ваших внутренних органов были заменены имплантами."
	icon = FA_ICON_USER_GEAR
	value = -6
	medical_record_text = "Во время медицинского осмотра у пациента было обнаружено множество низкобюджетных имплантов внутренних органов. \
    <b>Известно, что удаление этих органов опасно как для пациента, так и для врача.</b>"
	hardcore_value = 6
	mail_goodies = list(/obj/item/storage/organbox)

/datum/quirk/tin_man/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/static/list/organ_slots = list(
		ORGAN_SLOT_HEART = /obj/item/organ/heart/cybernetic/surplus,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs/cybernetic/surplus,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver/cybernetic/surplus,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach/cybernetic/surplus,
	)
	var/list/possible_organ_slots = organ_slots.Copy()
	if(HAS_TRAIT(human_holder, TRAIT_NOBLOOD))
		possible_organ_slots -= ORGAN_SLOT_HEART
	if(HAS_TRAIT(human_holder, TRAIT_NOBREATH))
		possible_organ_slots -= ORGAN_SLOT_LUNGS
	if(HAS_TRAIT(human_holder, TRAIT_LIVERLESS_METABOLISM))
		possible_organ_slots -= ORGAN_SLOT_LIVER
	if(HAS_TRAIT(human_holder, TRAIT_NOHUNGER))
		possible_organ_slots -= ORGAN_SLOT_STOMACH
	if(!length(organ_slots)) //what the hell
		return
	for(var/organ_slot in possible_organ_slots)
		var/organ_path = possible_organ_slots[organ_slot]
		var/obj/item/organ/new_organ = new organ_path()
		new_organ.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/tin_man/post_add()
	to_chat(quirk_holder, span_bolddanger("Большинство ваших внутренних органов были заменены имплантами. Они хрупкие и легко развалятся под давлением. \
Кроме того, любой ЭМИ заставит их полностью перестать работать."))
