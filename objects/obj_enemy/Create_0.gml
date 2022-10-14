speed_towards_arribaca = 0;
is_dead = false;
death_starting_force = 0;
death_force = 0;
death_force_increment = .2;
death_force_applied = 0;
death_rotation_increment = 0;
death_sprite_index = sprite_index;
death_image_index = 0;
points_on_death = 50;

function set_force(_force) {
	death_starting_force = _force;
	death_force = -_force;
}

function begin_rotate(_rotation_speed = 10) {
	death_rotation_increment = _rotation_speed;
}

function remove_if_offscreen() {
	if (x + (bbox_get_width(self) - bbox_get_xoffset(self)) < 0)
		instance_destroy();
}

function base_die() {
	is_dead = true;
	image_speed = 0;
	sprite_index = death_sprite_index;
	image_index = death_image_index;
	y -= 10;
	set_force(obj_arribaca.gravity_force);
	begin_rotate();
	increase_extra_point(self, points_on_death);
}

function die() {
	base_die();
}