event_inherited();

is_sliding = false;
slide_speed = 40;
slide_angle = 0;
slide_distance = 400;
starting_position = { x: 320, y: 0 };
cooldown_frames = max_frames_on_handing_over;

function prepare_to_slide() {
	var _margin = 160;
	var _minimum_y = obj_tap_area.bbox_top + _margin;
	var _maximum_y = obj_tap_area.bbox_bottom - _margin;
	var _y_range = _maximum_y - _minimum_y;
	starting_position.y = irandom_range(_minimum_y, _maximum_y);
	
	if (starting_position.y > _minimum_y + (_y_range * .5))
		slide_angle = irandom_range(0, 25);
	else
		slide_angle = irandom_range(335, 360);
	
	x = starting_position.x;
	y = starting_position.y;
}

prepare_to_slide();

function finish_slide() {
	is_sliding = false;
	is_holding = false;
}

function begin_slide() {
	is_sliding = true;
	is_holding = true;
}

function update_slide() {
	x += lengthdir_x(slide_speed, slide_angle);
	y += lengthdir_y(slide_speed, slide_angle);
	
	if (point_distance(starting_position.x, starting_position.y, x, y) >= slide_distance)
		finish_slide();
}