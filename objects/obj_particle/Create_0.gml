image_speed = random_range(.5, 1);
image_index = random_range(0, 6);
horizontal_speed = random_range(-2, 2);
vertical_speed = random_range(-2, 2);

function set_scale(_scale) {
	image_xscale = choose(-_scale, _scale);
	image_yscale = choose(-_scale, _scale);
}

set_scale(1);