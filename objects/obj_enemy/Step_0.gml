if (is_dead) {
	death_force += death_force_increment;

	if (death_force > death_starting_force)
		death_force = death_starting_force;

	death_force_applied += death_force;
	y += death_force_applied;
	image_angle += death_rotation_increment;
}

var _x_increment = obj_game.flying_speed + speed_towards_arribaca;
x -= _x_increment;
remove_if_offscreen();