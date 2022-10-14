if (poop_instance != noone)
	return;

poop_instance = other;
poop_instance.is_falling = false;
sprite_index = spr_guy_mad;
var _points = poop_instance.points_on_hit;

if (obj_dove.x > obj_dove.xstart + obj_dove.sprite_width)
	_points *= 2;

increase_extra_point(other, _points);

if (poop_instance.y >= bbox_top)
	poop_instance.image_angle = 90;