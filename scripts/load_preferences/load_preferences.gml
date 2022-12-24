/// @function load_preferences()

function load_preferences() {
	if (!file_exists(SAVE_PREFERENCES_FILE)) {
		var _default_preferences = { is_mute: false };
		
		with (obj_game)
			is_mute = _default_preferences.is_mute;
		
		save_preferences();
		return _default_preferences;
	}
	
	var file = file_text_open_read(SAVE_PREFERENCES_FILE);
	var _preferences = json_parse(file_text_read_string(file));
	file_text_close(file);
	
	return _preferences;
}