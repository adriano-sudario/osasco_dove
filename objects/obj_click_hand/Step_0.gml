frames_count++;

if (frames_count >= (is_holding ? max_frames_on_holding : max_frames_on_handing_over)) {
	frames_count = 0;
	is_holding = !is_holding;
	
	if (!is_holding) {
		x = xstart + irandom_range(-220, 260);
		y = ystart + irandom_range(-120, 180);
	}
}

if (is_holding)
	emit_particles();

image_index = is_holding ? 1 : 0;