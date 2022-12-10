function get_distance_display(_distance) {
	_distance = round(_distance);
	var _measure = "m";
	
	if (_distance >= 1000) {
		_distance = string_format(_distance / 1000, 1, 1);
		_measure = "km";
	} else {
		_distance = string(_distance);
	}
	
	return _distance + _measure;
}