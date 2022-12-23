event_inherited();

gravity_force = .5;
force_applied = 0;
floor_y_position = 0;
is_on_floor = false;
move_speed = 0;

function update_movement() {
	x -= move_speed;
	
	if (is_on_floor)
		return;
	
	force_applied += gravity_force;
	y += force_applied;
		
	if (!is_on_floor && bbox_bottom > obj_container.bbox_top) {
		y = floor_y_position;
		sprite_index = spr_skate_floor;
		is_on_floor = true;
	}
}