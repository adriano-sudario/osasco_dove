function resize_mobile_gui(_base_width, _base_height) {
	var _aspect = _base_width / _base_height;
	
	if (_aspect > 1)
	    display_set_gui_size(_base_height * _aspect, _base_height);
	else
	    display_set_gui_size(_base_width, _base_width / _aspect);
}