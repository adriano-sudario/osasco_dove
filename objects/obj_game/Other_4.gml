if (os_type == os_android)
	setup_android();

setup_draw();
instance_create_depth(0, 0, -999, obj_record_manager);
load_file();