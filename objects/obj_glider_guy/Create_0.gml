event_inherited();

min_y = 20;
max_y = 40;
speed_towards_dove = 1;
death_rotation_speed = -10;
var _bbox_yoffset = bbox_get_yoffset(self);
min_y += _bbox_yoffset;
var _bbox_height = bbox_get_height(self);
var _floor = obj_container.bbox_top;
max_y = _floor - max_y - _bbox_height + _bbox_yoffset;
range = max_y - min_y;
time_source = noone;
image_xscale = -1;
image_yscale = -1;
tween = noone;
was_removed = false;

function remove_time_source_and_tween() {
	if (time_source != noone) {
		time_source = noone;
		call_cancel(time_source);
	}
	
	if (tween != noone) {
		tween.stop();
		tween = noone;
	}
}

function destroy() {
	was_removed = true;
	remove_time_source_and_tween();
	instance_destroy();
}

function change_angle() {
	if (was_removed)
		return;
	
	var _angle = irandom_range(155, 180);
	
	if (y < min_y + (range * .5))
		_angle = irandom_range(205, 180);
	
	if (image_angle = 0)
		image_angle = _angle;
	else
		tween = tweening(TWEEN_MODE.PERSIST, TWEEN_MODIFIER.ANGLE, _angle, 250,
			{
				on_finish: function() { tween = noone }
			}
		);
	
	if (obj_game.flying_speed != 0)
		time_source = call_later(random_range(.25, .5), time_source_units_seconds, change_angle);
}

change_angle();

function update_movement() {
	if (is_dead) {
		remove_time_source_and_tween();
		base_update_movement();
		return;
	}
	
	var _force = obj_game.flying_speed + speed_towards_dove;
	x += lengthdir_x(_force, image_angle);
	y += lengthdir_y(_force, image_angle);
	
	if ((y <= min_y || y >= max_y) && tween == noone) {
		remove_time_source_and_tween();
		change_angle();
	}
}