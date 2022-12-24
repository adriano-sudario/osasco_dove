function play_sound(_sound, _is_loop = false, _volume = 1) {
	with (obj_game) {
		if (is_mute)
			return;
		
		audio_sound_gain(audio_play_sound(_sound, _is_loop ? 1 : 2, _is_loop), _volume, 0);
	}
}