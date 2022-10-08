if (!is_flying)
	return;

if (debug_mode && mouse_check_button_pressed(mb_middle))
	instance_create_layer(x, y, layer, obj_poop);

if (mouse_check_button(mb_left)) {
	generate_mouse_particles();
	
	flight_force_frames_count++;
	
	if (flight_force_frames_count >= flight_force_frames_reset)
		flight_force_frames_count = 0;
	
	if (flight_force_frames_count == 0)
		is_flight_force_applied = !is_flight_force_applied;
	
	gravity_force_applied -= flight_force;
} else {
	gravity_force_applied += gravity_force;
}

if (mouse_check_button_released(mb_left)) {
	is_flight_force_applied = false;
	flight_force_frames_count = -1;
}

y += gravity_force_applied;

image_index = is_flight_force_applied ? 2 : 1;