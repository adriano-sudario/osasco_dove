function increase_extra_point(_from_instance, _points) {
	var _increase_points = _points * obj_game.multiplier;
	obj_extra_manager.extra += _increase_points;
	
	tweening_custom(
		TWEEN_MODE.PERSIST,
		"shown_points",
		obj_extra_manager.extra,
		250,
		{ instance: obj_extra_manager }
	);
	
	with(instance_create_layer(_from_instance.x, _from_instance.y, layer, obj_extra_earned))
		points = _increase_points;
}