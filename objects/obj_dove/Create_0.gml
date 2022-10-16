gravity_force = .5;
flight_force = .5;
is_flight_force_applied = false;
is_flapping_wings = false;
flight_force_frames_count = -1;
flight_force_frames_reset = 7;
gravity_force_applied = 0;
is_flying = false;
can_dash = false;
is_dashing = false;
dash_speed = 25;
current_dash_speed = 0;
dash_break_force = .5;
dash_cooldown_ms = 3000;

function die() {
	var death_dove = instance_create_layer(x, y - 40, layer, obj_dove_dead);
	sprite_set_offset(death_dove, sprite_xoffset, sprite_yoffset);
	death_dove.set_force(gravity_force);
	obj_game.terminate();
	
	instance_destroy();
}

function dash(_angle) {
	if (!can_dash)
		return;
	
	is_dashing = true;
	current_dash_speed = dash_speed;
	can_dash = false;
	image_angle = _angle;
	image_index = 0;
	sprite_index = spr_dove_dash;
}

function on_dash_end() {
	is_dashing = false;
	image_angle = 0;
	image_index = 1;
	sprite_index = spr_dove_alive;
	obj_dash_cooldown_bar.begin_cooldown();
}

function flap_wings() {
	is_flapping_wings = true;
	flight_force_frames_count++;
	
	if (flight_force_frames_count >= flight_force_frames_reset)
		flight_force_frames_count = 0;
	
	if (flight_force_frames_count == 0)
		is_flight_force_applied = !is_flight_force_applied;
	
	gravity_force_applied -= flight_force;
}

function stop_flapping_wings() {
	is_flapping_wings = false;
	is_flight_force_applied = false;
	flight_force_frames_count = -1;
}

function poop() {
	instance_create_layer(x, y, layer, obj_poo);
}