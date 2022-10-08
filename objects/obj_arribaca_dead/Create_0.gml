starting_force = 0;
force = 0;
force_increment = .05;
force_applied = 0;
rotation_increment = 0;
shake = noone;

function set_force(_force) {
	starting_force = _force;
	force = -_force;
}

//function begin_shake(_magnitude = 4, _magnitude_increment = 0, _frames = -1) {
function begin_shake(_magnitude = 5, _magnitude_increment = .3, _frames = -1) {
	shake = {
		frames: _frames,
		magnitude: _magnitude,
		current_magnitude: _magnitude,
		magnitude_increment: _magnitude_increment,
		offset: { x: sprite_xoffset, y: sprite_yoffset }
	};
}

function begin_rotate(_rotation_speed = 10) {
	rotation_increment = _rotation_speed;
	image_yscale = -image_yscale;
	image_xscale = -image_xscale;
}

//begin_shake();
begin_rotate();