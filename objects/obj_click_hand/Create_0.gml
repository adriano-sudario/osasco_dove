max_frames_on_holding = 60;
frames_count = 0;
max_frames_on_handing_over = 20;
is_holding = false;

function emit_particles() {
	var _radius = 35;
	var _direction = -25;
	var _interval = 5;
	
	while (_direction < 205) {
		var _x = x + lengthdir_x(_radius, _direction);
		var _y = y + lengthdir_y(_radius, _direction);
		var _particle = instance_create_depth(_x, _y, depth - 1, obj_particle);
		_particle.set_scale(.25);
		_direction += _interval;
	}
}