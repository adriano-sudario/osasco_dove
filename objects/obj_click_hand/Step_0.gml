if (mouse_check_button_pressed(mb_left)) {
	with (obj_arribaca)
		is_flying = true;
	
	with (obj_cliff)
		is_leaving = true;
	
	instance_destroy();
}

frames_count++;

if (frames_count >= (is_holding ? max_frames_on_holding : max_frames_on_handing_over)) {
	frames_count = 0;
	is_holding = !is_holding;
	
	if (!is_holding) {
		x = xstart + lengthdir_x(irandom(280), irandom(360));
		y = ystart + lengthdir_x(irandom(280), irandom(360));
	}
}

if (is_holding) {
	var _radius = 50;
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

image_index = is_holding ? 1 : 0;