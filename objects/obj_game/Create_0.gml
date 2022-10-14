#macro STARTING_FLYING_SPEED 10;
#macro STARTING_MULTIPLIER 1;
flying_speed = STARTING_FLYING_SPEED;
multiplier = STARTING_MULTIPLIER;
has_ended = false;
has_started = false;
has_shown_slide_tutorial = false;

function terminate() {
	with(obj_record_manager) {
		var _distance = obj_distance_manager.distance;
		var _points = _distance + obj_extra_manager.extra;
		
		if (_points > best_points)
			best_points = _points;
		
		if (_distance > best_distance)
			_distance = _distance;
		
		distance_description = "further: " + obj_distance_manager.get_distance_display();
		points_description = "best: " + string(best_distance + best_points) + "pts";
		description = "best: " + string(best_distance + best_points) + "pts ~ " +
			obj_distance_manager.get_distance_display();
	}
	
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
	
	with(instance_create_depth(obj_poop_button.x, obj_poop_button.y, -999, obj_back_button)) {
		image_xscale = 0;
		image_yscale = 0;
	}
	
	with(obj_points_manager) {
		image_xscale = 0;
		image_yscale = 0;
	}
	
	var _milliseconds = 500;
	
	tweening(TWEEN_MODE.PERSIST, TWEEN_MODIFIER.SIZE, 1, _milliseconds,
		{
			on_finish: function() { is_active = true; },
			ease_function: out_back,
			instance: obj_back_button
		}
	);
	
	tweening(TWEEN_MODE.PERSIST, TWEEN_MODIFIER.SIZE, 1, _milliseconds,
		{
			ease_function: out_back,
			instance: obj_points_manager
		}
	);
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
	
	if (!instance_exists(obj_record_manager))
		instance_create_depth(0, 0, -999, obj_record_manager);
	
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