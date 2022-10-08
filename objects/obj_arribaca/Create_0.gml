gravity_force = .5;
flight_force = .5;
is_flight_force_applied = false;
flight_force_frames_count = -1;
flight_force_frames_reset = 7;
gravity_force_applied = 0;
is_flying = false;

function die() {
	var death_arribas = instance_create_layer(x, y - 40, layer, obj_arribaca_dead);
	sprite_set_offset(death_arribas, sprite_xoffset, sprite_yoffset);
	death_arribas.set_force(gravity_force);
	instance_destroy();
}