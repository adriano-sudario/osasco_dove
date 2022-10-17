if (!is_active) {
	if (keyboard_check_pressed(vk_up))
		start_game();
	else
		return;
}

is_dove_alive = instance_exists(obj_dove);

if (!is_dove_alive) {
	if (keyboard_check(vk_left))
		room_restart();
	
	return;
}

if (keyboard_check(vk_up))
	obj_dove.flap_wings();

if (keyboard_check_released(vk_up))
	obj_dove.stop_flapping_wings();

if (keyboard_check_pressed(vk_right))
	on_dash_input();

if (keyboard_check_pressed(vk_down) || mouse_check_button_pressed(mb_middle))
	on_poop_input_begin();

if (keyboard_check_released(vk_down) || mouse_check_button_released(mb_middle))
	on_poop_input_released();