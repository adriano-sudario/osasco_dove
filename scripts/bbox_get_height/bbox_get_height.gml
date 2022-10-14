function bbox_get_height(_instance) {
	if (_instance.bbox_top < 0 && _instance.bbox_bottom < 0)
		return abs(_instance.bbox_top) - abs(_instance.bbox_bottom);
	else if (_instance.bbox_top < 0 && _instance.bbox_bottom > 0)
		return _instance.bbox_bottom + abs(_instance.bbox_top);
	else
		return _instance.bbox_bottom - _instance.bbox_top;
}