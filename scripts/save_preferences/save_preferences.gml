/// @function save_preferences()

function save_preferences() {
	with (obj_game) {
		var file = file_text_open_write(SAVE_PREFERENCES_FILE);
		file_text_write_string(file, json_stringify({ is_mute: is_mute }));
		file_text_close(file);
	}
}