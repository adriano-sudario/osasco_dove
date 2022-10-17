if (!is_flying)
	return;

if (is_dashing) {
	x += lengthdir_x(current_dash_speed, image_angle);
	y += lengthdir_y(current_dash_speed, image_angle);
	current_dash_speed -= dash_break_force;
	
	if (current_dash_speed <= obj_game.current_level.dash_distance)
		on_dash_end();
	
	instance_create_layer(x - 60, y, layer, obj_dove_particle);
	
	return;
}

if (x > xstart) {
	x -= obj_game.flying_speed;
	
	if (x < xstart)
		x = xstart;
}

if (!is_flapping_wings)
	gravity_force_applied += gravity_force;

y += gravity_force_applied;
image_index = is_flight_force_applied ? 2 : 1;