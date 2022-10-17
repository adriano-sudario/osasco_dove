is_active = false;

function start_game() {
	is_active = true;
	obj_inputs_controller.is_active = true;
	obj_game.start();
}

function on_dash_input() {
	if (instance_exists(obj_slide_hand)) {
		obj_game.has_shown_slide_tutorial = true;
		instance_destroy(obj_slide_hand);
	}
	
	var _angle = 0;
	
	if (keyboard_check(vk_up))
		_angle = 25;
	else if (keyboard_check(vk_down))
		_angle = 335;
	
	obj_dove.dash(_angle);
}

function on_poop_input_begin() {
	obj_dove.poop();
	obj_poop_button.image_xscale = .75;
	obj_poop_button.image_yscale = .75;
}

function on_poop_input_released() {
	obj_poop_button.image_xscale = 1;
	obj_poop_button.image_yscale = 1;
}