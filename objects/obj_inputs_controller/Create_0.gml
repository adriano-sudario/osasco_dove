is_holding_tap = false;
is_holding_poop_button = false;
is_dove_alive = instance_exists(obj_dove);
tap_hold_positions = [];
boost_minimum_distance = 200;
is_active = false;
elapsed_holding_tap_ms = 0;
max_holding_tap_ms_to_dash = 250;

function start_game() {
	with(obj_keyboard_inputs_controller)
		is_active = true;
	
	is_active = true;
	obj_game.start();
}

function on_tap_begin() {
	is_holding_tap = true;
	tap_hold_positions = [];
	elapsed_holding_tap_ms = 0;
}

function on_tap_hold() {
	elapsed_holding_tap_ms += delta_time / 1000;
	
	if (elapsed_holding_tap_ms <= max_holding_tap_ms_to_dash)
		array_push(tap_hold_positions, { x: mouse_x, y: mouse_y });
	
	if (is_dove_alive) {
		generate_mouse_particles();
		obj_dove.flap_wings();
	}
}

function on_tap_released() {
	if (is_dove_alive) {
		obj_dove.stop_flapping_wings();
		var _taps_length = array_length(tap_hold_positions);
	
		if (_taps_length > 0 && elapsed_holding_tap_ms <= max_holding_tap_ms_to_dash) {
			var _first_tap = tap_hold_positions[0];
			var _last_tap = tap_hold_positions[_taps_length - 1];
			var _is_left_to_right = _first_tap.x < _last_tap.x;
			var _tap_distance = point_distance(_first_tap.x, _first_tap.y, _last_tap.x, _last_tap.y);
			
			if (_is_left_to_right && _tap_distance >= boost_minimum_distance) {
				if (instance_exists(obj_slide_hand)) {
					obj_game.has_shown_slide_tutorial = true;
					instance_destroy(obj_slide_hand);
				}
				
				var _angle = point_direction(_first_tap.x, _first_tap.y, _last_tap.x, _last_tap.y);
				obj_dove.dash(_angle);
			}
		}
	}
	
	elapsed_holding_tap_ms = 0;
	tap_hold_positions = [];
	is_holding_tap = false;
}

function on_poop_button_tap_begin() {
	is_holding_poop_button = true;
	obj_dove.poop();
	obj_poop_button.image_xscale = .75;
	obj_poop_button.image_yscale = .75;
}

function on_poop_button_tap_released() {
	is_holding_poop_button = false;
	obj_poop_button.image_xscale = 1;
	obj_poop_button.image_yscale = 1;
}