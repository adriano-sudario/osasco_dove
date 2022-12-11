function disable_application_surface() {
	application_surface_enable(false);
	
	var _base_width = room_width;
	var _base_height = room_height;
	var _aspect = _base_width / _base_height;
	
	display_set_gui_size(_base_width, _base_width / _aspect);
}