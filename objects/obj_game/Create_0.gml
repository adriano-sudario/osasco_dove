#macro STARTING_FLYING_SPEED 10;
#macro STARTING_MULTIPLIER 1;
flying_speed = STARTING_FLYING_SPEED;
multiplier = STARTING_MULTIPLIER;
has_ended = false;
has_started = false;

function terminate() {
	flying_speed = 0;
	has_started = false;
	has_ended = true;
	
	with(obj_slide_hand)
		instance_destroy();
	
	with (obj_dash_cooldown_bar)
		instance_destroy();
	
	with (obj_poop_button)
		visible = false;
	
	with (obj_spawner) {
		if (time_source != noone)
			call_cancel(time_source);
		
		instance_destroy();
	}
}

function setup_objects_on_start() {
	with (obj_arribaca)
		is_flying = true;
	
	with (obj_cliff)
		is_leaving = true;
	
	with (obj_poop_button)
		visible = true;
	
	with (obj_game)
		flying_speed = STARTING_FLYING_SPEED;
		
	with (obj_click_hand)
		instance_destroy();
	
	instance_create_depth(0, 0, -999, obj_distance_manager);
	instance_create_depth(0, 0, -999, obj_extra_manager);
	instance_create_depth(0, 0, -999, obj_points_manager);
	instance_create_layer(0, 0, layer, obj_spawner);
	obj_dash_cooldown_bar.load();
}

function setup_draw() {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
}

function reset_variables() {
	flying_speed = STARTING_FLYING_SPEED;
	multiplier = STARTING_MULTIPLIER;
	has_started = true;
	has_ended = false;
}

function start() {
	reset_variables();
	setup_draw();
	setup_objects_on_start();
}