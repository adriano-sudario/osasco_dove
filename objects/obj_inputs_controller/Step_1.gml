if (!is_active) {
	if (mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_tap_area, false, false))
		start_game();
	else
		return;
}

is_dove_alive = instance_exists(obj_dove);

if (mouse_check_button_pressed(mb_left)) {
	if (instance_exists(obj_back_button)) {
		if (collision_point(mouse_x, mouse_y, obj_back_button, false, false))
			room_restart();
	} else {
		var _is_poop_button_avaiable = is_dove_alive && obj_poop_button.is_active;
	
		if (_is_poop_button_avaiable && collision_point(mouse_x, mouse_y, obj_poop_button, false, false))
			on_poop_button_tap_begin();
		
		if (collision_point(mouse_x, mouse_y, obj_tap_area, false, false))
			on_tap_begin();
	}
}

if (mouse_check_button_released(mb_left)) {
	if (is_holding_poop_button)
		on_poop_button_tap_released();

	if (is_holding_tap)
		on_tap_released();
}

if (is_holding_tap)
	on_tap_hold();