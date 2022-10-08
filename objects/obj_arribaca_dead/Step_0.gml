force += force_increment;

if (force > starting_force)
	force = starting_force;

force_applied += force;
y += force_applied;

image_angle += rotation_increment;

if (bbox_top > obj_void.bbox_top + (shake != noone ? shake.magnitude : 0))
	instance_destroy();

if (shake != noone) {
	var xoffset = shake.offset.x
		+ random_range(-shake.current_magnitude, shake.current_magnitude);
	var yoffset = shake.offset.y
		+ random_range(-shake.current_magnitude, shake.current_magnitude);
	
	sprite_set_offset(spr_arribaca_dead, xoffset, yoffset);
	
	shake.current_magnitude += shake.magnitude_increment;
	shake.current_magnitude -= max(0, (1 / shake.frames) * shake.magnitude);
	
	if (shake.current_magnitude <= 0)
		shake = noone;
}