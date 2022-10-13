frames_count++;

if (frames_count >= (is_holding ? max_frames_on_holding : max_frames_on_handing_over)) {
	frames_count = 0;
	is_holding = !is_holding;
	
	if (!is_holding) {
		x = xstart + lengthdir_x(irandom(280), irandom(360));
		y = ystart + lengthdir_x(irandom(280), irandom(360));
	}
}

if (is_holding)
	emit_particles();

image_index = is_holding ? 1 : 0;