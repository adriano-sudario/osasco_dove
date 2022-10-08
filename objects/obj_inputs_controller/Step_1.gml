var _has_tapped = mouse_check_button_pressed(mb_left);

if (instance_exists(obj_click_hand)) {
	var _has_started = _has_tapped && collision_point(mouse_x, mouse_y, obj_void, false, false);
	
	if (_has_started) {
		with (obj_arribaca)
			is_flying = true;
	
		with (obj_cliff)
			is_leaving = true;
	
		with (obj_poop_button)
			visible = true;
	
		instance_destroy(obj_click_hand);
	} else {
		return;
	}
}

var _is_arribaca_alive = instance_exists(obj_arribaca);

if (_has_tapped
	&& _is_arribaca_alive
	&& obj_poop_button.is_active
	&& collision_point(mouse_x, mouse_y, obj_poop_button, false, false)) {
	is_holding_poop_button = true;
	obj_arribaca.poop();
	obj_poop_button.image_xscale = .75;
	obj_poop_button.image_yscale = .75;
} else if (_has_tapped
	&& collision_point(mouse_x, mouse_y, obj_void, false, false)) {
	is_holding_tap = true;
}

if (is_holding_poop_button && mouse_check_button_released(mb_left)) {
	is_holding_poop_button = false;
	obj_poop_button.image_xscale = 1;
	obj_poop_button.image_yscale = 1;
} else if (is_holding_tap && mouse_check_button_released(mb_left)) {
	is_holding_tap = false;
	
	if (_is_arribaca_alive)
		obj_arribaca.stop_flapping_wings();
}

if (is_holding_tap && _is_arribaca_alive) {
	generate_mouse_particles();
	obj_arribaca.flap_wings();
}