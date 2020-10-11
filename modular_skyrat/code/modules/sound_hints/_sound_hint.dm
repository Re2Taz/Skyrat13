//Do a little sound hint
/proc/sound_hint(atom/target, mob/user, duration = 5, override_icon_state, override_icon)
	var/hint_icon = 'modular_skyrat/icons/effects/sound/sound_1.dmi'
	if(override_icon)
		hint_icon = override_icon
	var/hint_state = pick("sound1", "sound2")
	if(override_icon_state)
		hint_state = override_icon_state
	var/image/I = image(hint_icon, target, hint_state, FLOAT_LAYER)
	I.plane = FLOAT_PLANE
	for(var/mob/M in get_hearers_in_view(world.view, target))
		if(M.client)
			M.client.images += I
	spawn(duration)
		qdel(I)
