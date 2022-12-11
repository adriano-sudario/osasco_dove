if (is_mobile)
	setup_mobile();
else
	instance_create_layer(0, 0, layer, obj_keyboard_inputs_controller);

setup_draw();
instance_create_depth(0, 0, -999, obj_record_manager);
load_file();