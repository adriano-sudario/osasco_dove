if (!is_active) {
	if (mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_tap_area, false, false))
		start_game();
	else
		return;
}

is_arribaca_alive = instance_exists(obj_arribaca);

if (mouse_check_button_pressed(mb_left)) {
	if (instance_exists(obj_back_button)) {
		if (collision_point(mouse_x, mouse_y, obj_back_button, false, false))
			room_restart();
	} else {
		var _is_poop_button_avaiable = is_arribaca_alive && obj_poop_button.is_active;
	
		if (_is_poop_button_avaiable && collision_point(mouse_x, mouse_y, obj_poop_button, false, false))
			on_poop_button_tap_begin();
		else if (collision_point(mouse_x, mouse_y, obj_tap_area, false, false))
			on_tap_begin();
	}
}

if (is_holding_poop_button && mouse_check_button_released(mb_left))
	on_poop_button_tap_released();
else if (is_holding_tap && mouse_check_button_released(mb_left))
	on_tap_released();

if (is_holding_tap)
	on_tap_hold();