function increase_extra_point(_from_instance, _points) {
	with(obj_game) {
		var _increase_points = _points * multiplier;
		extra_points += _increase_points;
		tweening_custom(TWEEN_MODE.PERSIST, "shown_extra_points", extra_points, 250);
	}
	
	with(instance_create_layer(_from_instance.x, _from_instance.y, layer, obj_extra_earned))
		points = _increase_points;
	
	play_sound(sfx_score);
}