function generate_mouse_particles() {
	repeat(round(random_range(3, 5)))
		instance_create_depth(mouse_x, mouse_y, -9999, obj_particle);
}