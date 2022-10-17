speed_towards_dove = 0;
is_dead = false;
death_starting_force = 0;
death_force = 0;
death_force_increment = .2;
death_force_applied = 0;
death_rotation_increment = 0;
death_sprite_index = sprite_index;
death_image_index = 0;
death_rotation_speed = 10;
points_on_death = 25;

function set_force(_force) {
	death_starting_force = _force;
	death_force = -_force;
}

function begin_rotate() {
	death_rotation_increment = death_rotation_speed;
}

function destroy() {
	instance_destroy();
}

function remove_if_offscreen() {
	if (x + (bbox_get_width(self) - bbox_get_xoffset(self)) < 0)
		destroy();
}

function on_dead() {
	death_force += death_force_increment;

	if (death_force > death_starting_force)
		death_force = death_starting_force;

	death_force_applied += death_force;
	y += death_force_applied;
	image_angle += death_rotation_increment;
}

function base_update_movement() {
	var _x_increment = obj_game.flying_speed + speed_towards_dove;
	x -= _x_increment;
}

function update_movement() {
	base_update_movement();
}

function base_die() {
	is_dead = true;
	image_speed = 0;
	sprite_index = death_sprite_index;
	image_index = death_image_index;
	y -= 10;
	set_force(obj_dove.gravity_force);
	begin_rotate();
	increase_extra_point(self, points_on_death);
}

function die() {
	base_die();
}