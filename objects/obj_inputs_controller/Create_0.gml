is_holding_tap = false;
is_holding_poop_button = false;
is_arribaca_alive = instance_exists(obj_arribaca);
tap_hold_positions = [];
boost_minimum_distance = 200;
is_active = false;
elapsed_holding_tap_ms = 0;
max_holding_tap_ms_to_dash = 250;

function start_game() {
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
	
	if (is_arribaca_alive) {
		generate_mouse_particles();
		obj_arribaca.flap_wings();
	}
}

function on_tap_released() {
	is_holding_tap = false;
	
	if (is_arribaca_alive) {
		obj_arribaca.stop_flapping_wings();
		
		if (elapsed_holding_tap_ms <= max_holding_tap_ms_to_dash) {
			var _taps_length = array_length(tap_hold_positions);
			var _first_tap = tap_hold_positions[0];
			var _last_tap = tap_hold_positions[_taps_length - 1];
			var _is_left_to_right = _first_tap.x < _last_tap.x;
			var _tap_distance = point_distance(_first_tap.x, _first_tap.y, _last_tap.x, _last_tap.y);
			
			if (_is_left_to_right && _tap_distance >= boost_minimum_distance) {
				if (instance_exists(obj_slide_hand))
					instance_destroy(obj_slide_hand);
				
				var _angle = point_direction(_first_tap.x, _first_tap.y, _last_tap.x, _last_tap.y);
				obj_arribaca.dash(_angle);
			}
		}
	}
	
	elapsed_holding_tap_ms = 0;
	tap_hold_positions = [];
}

function on_poop_button_tap_begin() {
	is_holding_poop_button = true;
	obj_arribaca.poop();
	obj_poop_button.image_xscale = .75;
	obj_poop_button.image_yscale = .75;
}

function on_poop_button_tap_released() {
	is_holding_poop_button = false;
	obj_poop_button.image_xscale = 1;
	obj_poop_button.image_yscale = 1;
}