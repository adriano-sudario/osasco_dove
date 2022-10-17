function increase_extra_point(_from_instance, _points) {
	with(obj_game) {
		var _increase_points = _points * multiplier;
		shown_extra_points += _increase_points;
		tweening_custom(TWEEN_MODE.PERSIST, "shown_extra_points", shown_extra_points, 250);
	}
	
	with(instance_create_layer(_from_instance.x, _from_instance.y, layer, obj_extra_earned))
		points = _increase_points;
	
	play_sound(sfx_score);
}