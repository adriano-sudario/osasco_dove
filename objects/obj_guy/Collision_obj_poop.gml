if (poop_instance != noone)
	return;

poop_instance = other;
poop_instance.is_falling = false;
sprite_index = spr_guy_mad;
increase_extra_point(other, poop_instance.points_on_hit);

if (poop_instance.y >= bbox_top)
	poop_instance.image_angle = 90;