function bbox_get_width(_instance) {
	if (_instance.bbox_left < 0 && _instance.bbox_right < 0)
		return abs(_instance.bbox_left) - abs(_instance.bbox_right);
	else if (_instance.bbox_left < 0 && _instance.bbox_right > 0)
		return _instance.bbox_right + abs(_instance.bbox_left);
	else
		return _instance.bbox_right - _instance.bbox_left;
}