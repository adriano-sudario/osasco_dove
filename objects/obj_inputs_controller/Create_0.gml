is_holding_tap = false;
is_holding_poop_button = false;
is_arribaca_alive = instance_exists(obj_arribaca);

function start_game() {
	with (obj_arribaca)
		is_flying = true;
	
	with (obj_cliff)
		is_leaving = true;
	
	with (obj_poop_button)
		visible = true;
	
	instance_destroy(obj_click_hand);
}

function on_tap_begin() {
	is_holding_tap = true;
}

function on_tap_hold() {
	if (is_arribaca_alive) {
		generate_mouse_particles();
		obj_arribaca.flap_wings();
	}
}

function on_tap_released() {
	is_holding_tap = false;
	
	if (is_arribaca_alive)
		obj_arribaca.stop_flapping_wings();
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