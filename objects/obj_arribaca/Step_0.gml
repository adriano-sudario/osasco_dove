if (!is_flying)
	return;

//if (debug_mode && mouse_check_button_pressed(mb_middle))
//	instance_create_layer(x, y, layer, obj_poop);

//if (mouse_check_button(mb_left))
//	flap_wings();

if (!is_flapping_wings)
	gravity_force_applied += gravity_force;

//if (mouse_check_button_released(mb_left))
//	stop_flapping_wings();

y += gravity_force_applied;
image_index = is_flight_force_applied ? 2 : 1;