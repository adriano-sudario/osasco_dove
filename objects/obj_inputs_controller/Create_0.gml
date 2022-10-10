is_holding_tap = false;
is_holding_poop_button = false;
is_arribaca_alive = instance_exists(obj_arribaca);
tap_hold_frames_count = 0;
tap_hold_positions = [];
boost_minimum_distance = 200;

function start_game() {
	with (obj_arribaca)
		is_flying = true;
	
	with (obj_cliff)
		is_leaving = true;
	
	with (obj_poop_button)
		visible = true;
	
	with (obj_game)
		flying_speed = STARTING_FLYING_SPEED;
	
	instance_destroy(obj_click_hand);
}

function on_tap_begin() {
	is_holding_tap = true;
	tap_hold_frames_count = 0;
	tap_hold_positions = [];
}

function on_tap_hold() {
	tap_hold_frames_count++;
	
	if (tap_hold_frames_count <= 10)
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
		
		if (tap_hold_frames_count <= 10) {
			var _taps_length = array_length(tap_hold_positions);
			var _first_tap = tap_hold_positions[0];
			var _last_tap = tap_hold_positions[_taps_length - 1];
			var _is_left_to_right = _first_tap.x < _last_tap.x;
			var _tap_distance = point_distance(_first_tap.x, _first_tap.y, _last_tap.x, _last_tap.y);
			
			if (_is_left_to_right && _tap_distance >= boost_minimum_distance) {
				var _angle = point_direction(_first_tap.x, _first_tap.y, _last_tap.x, _last_tap.y);
				obj_arribaca.dash(_angle);
			}
		}
	}
	
	tap_hold_frames_count = 0;
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