/// @function load_file()

function load_file() {
	if (!file_exists(SAVE_FILE))
		return;
	
	var buffer = buffer_load("save.bin");
	var decompressed_buffer = buffer_decompress(buffer);
	var json_game_state = buffer_read(decompressed_buffer, buffer_string);
	var _data = json_parse(json_game_state);
	
	with(obj_game)
		has_shown_slide_tutorial = _data.has_shown_slide_tutorial;
		
	with(obj_record_manager) {
		best_points = _data.best_points;
		best_distance = _data.best_distance;
		best_poops_hit = _data.best_poops_hit;
		update_descriptions();
	}
	
	buffer_delete(buffer);
	buffer_delete(decompressed_buffer);
}