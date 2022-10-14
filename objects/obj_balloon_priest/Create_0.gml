event_inherited();

has_started_tweening = false;
death_sprite_index = spr_guy;
death_image_index = 1;

function die() {
	instance_create_layer(x, y, layer, obj_balloons);
	base_die();
}

function start_tweening() {
	has_started_tweening = true;
	tweening(TWEEN_MODE.YOYO, TWEEN_MODIFIER.VERTICAL_POSITION, y - 80, 1000,
		{
			ease_function: in_out_cubic
		}
	);
}