/datum/quirk/echolocation
	name = "Эхолокация"
	desc = "Хотя ваши глаза больше не функционируют, вы приспосабливаетесь к этому с помощью некоторых средств экстрасенсорной эхолокации и чувствительного слуха. Будьте осторожны: если вы когда-нибудь оглохнете, вы также потеряете свою эхолокацию, пока не поправитесь!"
	gain_text = span_notice("Малейшие звуки создают карту вашего окружения.")
	lose_text = span_notice("Мир снова наполнен яркими красками")
	value = -14
	icon = FA_ICON_EAR_LISTEN
	mob_trait = TRAIT_GOOD_HEARING
	medical_record_text = "Глаза пациента биологически нефункциональны. Тесты на слух показывают почти сверхъестественную остроту."
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_CHANGES_APPEARANCE
	mail_goodies = list(/obj/item/clothing/glasses/sunglasses, /obj/item/cane/white)
	/// where we store easy access to the character's echolocation component (for stuff like drugs)
	var/datum/component/echolocation/esp
	/// where we store access to the client colour we make
	var/datum/client_colour/echolocation_custom/esp_color
	/// The action we add with this quirk in add(), used for easy deletion later
	var/datum/action/cooldown/spell/added_action

/datum/quirk/echolocation/add(client/client_source)
	// echolocation component handles blinding us already so we don't need to worry about that
	var/mob/living/carbon/human/human_holder = quirk_holder
	// set up the desired echo group from our quirk preferences
	var/client_echo_group = LOWER_TEXT(client_source?.prefs.read_preference(/datum/preference/choiced/echolocation_key))
	if (isnull(client_echo_group))
		client_echo_group = "echolocation"
	if (client_echo_group == "psychic")
		client_echo_group = "psyker" // set this non-player-facing so they share echolocation with coded chaplain psykers/pirates and the like

	// Get the prefs
	var/client_show_outline = client_source?.prefs.read_preference(/datum/preference/toggle/echolocation_overlay)
	var/col = color_hex2color_matrix(client_source?.prefs.read_preference(/datum/preference/color/echolocation_outline))

	human_holder.AddComponent(\
		/datum/component/echolocation, \
		blocking_trait = TRAIT_DEAF, \
		cooldown_time = 2 SECONDS, \
		echo_range = 7, \
		echo_group = client_echo_group, \
		images_are_static = FALSE, \
		use_echo = FALSE, \
		show_own_outline = client_show_outline, \
		personal_color = col \
	)
	esp = human_holder.GetComponent(/datum/component/echolocation)

	human_holder.remove_client_colour(REF(src))
	esp_color = human_holder.add_client_colour(/datum/client_colour/echolocation_custom, REF(src))
	esp_color.update_color(col)

	// add an action/spell to allow the player to toggle echolocation off for a bit (eyestrain on longer rounds, or just roleplay)
	var/datum/action/cooldown/spell/echolocation_toggle/toggle_action = new /datum/action/cooldown/spell/echolocation_toggle()
	toggle_action.Grant(human_holder)
	added_action = toggle_action
	RegisterSignal(human_holder, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine_text))

/datum/quirk/echolocation/remove()
	QDEL_NULL(esp) // echolocation component removal handles graceful disposal of everything above
	QDEL_NULL(added_action) // remove the stall action, too
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.remove_client_colour(REF(src)) // clean up the custom colour override we added
	UnregisterSignal(human_holder, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine_text))

/datum/quirk/echolocation/proc/on_examine_text(client/client_source, mob/user, list/examine_list)
	SIGNAL_HANDLER
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/datum/quirk/echolocation/echo = human_holder.get_quirk(/datum/quirk/echolocation)
	var/datum/component/echolocation/quirk_esp = echo.esp

	if(quirk_esp.stall == TRUE)
		return
	examine_list += span_cyan("[human_holder.p_They()] [human_holder.p_have()] [human_holder.p_their()] уши навострились, внимательно прислушиваясь даже к малейшему шуму.")

/datum/client_colour/echolocation_custom
	color = COLOR_MATRIX_SEPIATONE
	priority = 1
	override = TRUE

/datum/action/cooldown/spell/echolocation_toggle
	name = "Включить эхолокацию"
	desc = "Решите, хотите ли вы прекратить эхолокацию (или начать снова). Полезно, если вам нужен перерыв — это нелегкий процесс!"
	spell_requirements = NONE
	cooldown_time = 2 SECONDS
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "blink"

/datum/action/cooldown/spell/echolocation_toggle/is_valid_target(atom/cast_on)
	return ishuman(cast_on)

/datum/action/cooldown/spell/echolocation_toggle/cast(mob/living/carbon/human/cast_on)
	. = ..()
	var/datum/quirk/echolocation/echo = cast_on.get_quirk(/datum/quirk/echolocation)
	if (isnull(echo))
		return

	var/datum/component/echolocation/quirk_esp = echo.esp
	if (isnull(quirk_esp))
		return

	if (quirk_esp.stall)
		quirk_esp.stall = FALSE
		cast_on.balloon_alert(cast_on, "Старт эхолокации!")
		cast_on.visible_message(span_notice("[cast_on] оживляется, внезапно становясь более бдительным!"))
	else
		quirk_esp.stall = TRUE
		cast_on.balloon_alert(cast_on, "Остановка эхолокации!")
		cast_on.visible_message(span_notice("[cast_on] слегка расслабляется, на мгновение становясь менее бдительным."))
