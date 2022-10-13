if (is_sliding) {
	update_slide();
} else {
	frames_count++;

	if (frames_count >= cooldown_frames) {
		frames_count = 0;
	
		if (x == starting_position.x)
			begin_slide();
		else
			prepare_to_slide();
	}
}

if (is_holding)
	emit_particles();

image_index = is_holding ? 1 : 0;