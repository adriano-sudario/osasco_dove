points_value = 50;

function remove_if_offscreen() {
	if (x + (bbox_get_width(self) - bbox_get_xoffset(self)) < 0)
		instance_destroy();
}