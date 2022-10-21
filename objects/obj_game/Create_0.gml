#macro STARTING_FLYING_SPEED 10;
#macro STARTING_MULTIPLIER 1;
#macro STARTING_DASH_COOLDOWN 3000;
flying_speed = STARTING_FLYING_SPEED;
multiplier = STARTING_MULTIPLIER;
distance = 0;
extra_points = 0;
poops_hit_count = 0;
shown_extra_points = 0;
has_ended = false;
has_started = false;
has_shown_slide_tutorial = false;

collectible = {
	coin: { index: obj_coin, y_range: { min_y: 20, max_y: 20 } }
};
enemy = {
	guy: { index: obj_guy, y_range: noone },
	airplane: { index: obj_airplane, y_range: { min_y: 20, max_y: 240 } },
	big_cry: { index: obj_big_cry, y_range: noone },
	balloon_priest: { index: obj_balloon_priest, y_range: { min_y: 100, max_y: 100 } },
	glider_guy: { index: obj_glider_guy, y_range: { min_y: 20, max_y: 240 } },
};
var _begining_dash_distance = STARTING_FLYING_SPEED;
levels_config = [
	{
		speed_increment: 0,
		multiplier_increment: 0,
		enemies: [enemy.guy],
		spawn_seconds_range: { minimum: 2, maximum: 4 },
		collectible_spawn_chance: .25,
		maximum_distance: 100,
		dash_distance: _begining_dash_distance,
		dash_cooldown_decrement: 0,
	},
	{
		speed_increment: 2,
		multiplier_increment: .25,
		enemies: [enemy.guy, enemy.airplane, enemy.big_cry],
		spawn_seconds_range: { minimum: 2, maximum: 4 },
		collectible_spawn_chance: .25,
		maximum_distance: 750,
		dash_distance: _begining_dash_distance,
		dash_cooldown_decrement: 250,
	},
	{
		speed_increment: 2,
		multiplier_increment: .5,
		enemies: [enemy.guy, enemy.airplane, enemy.big_cry, enemy.balloon_priest, enemy.glider_guy],
		spawn_seconds_range: { minimum: 2, maximum: 3.5 },
		collectible_spawn_chance: .2,
		maximum_distance: 1500,
		dash_distance: _begining_dash_distance,
		dash_cooldown_decrement: 250,
	},
	{
		speed_increment: 1,
		multiplier_increment: .75,
		enemies: [
			enemy.guy,
			enemy.airplane,
			enemy.airplane,
			enemy.big_cry,
			enemy.big_cry,
			enemy.balloon_priest,
			enemy.glider_guy,
		],
		spawn_seconds_range: { minimum: 1.5, maximum: 3 },
		collectible_spawn_chance: .2,
		maximum_distance: 3000,
		dash_distance: _begining_dash_distance + 3,
		dash_cooldown_decrement: 500,
	},
	{
		speed_increment: 1,
		multiplier_increment: 1.5,
		enemies: [
			enemy.guy,
			enemy.airplane,
			enemy.airplane,
			enemy.big_cry,
			enemy.big_cry,
			enemy.balloon_priest,
			enemy.balloon_priest,
			enemy.glider_guy,
			enemy.glider_guy,
		],
		spawn_seconds_range: { minimum: 1.5, maximum: 3 },
		collectible_spawn_chance: .15,
		maximum_distance: 6000,
		dash_distance: _begining_dash_distance + 5,
		dash_cooldown_decrement: 500,
	},
	{
		speed_increment: 1,
		multiplier_increment: .25,
		enemies: [enemy.guy, enemy.airplane, enemy.big_cry, enemy.balloon_priest, enemy.glider_guy],
		spawn_seconds_range: { minimum: 1.5, maximum: 3 },
		collectible_spawn_chance: .1,
		maximum_distance: 10000,
		dash_distance: _begining_dash_distance + 5,
		dash_cooldown_decrement: 0,
	},
];
level = 0;
current_level = levels_config[level];
is_mobile = os_type == os_android;

if (os_type == os_gxgames)
{
	var _info = os_get_info();
	is_mobile = _info[? "mobile"];
}

if (!is_mobile)
	instance_create_layer(0, 0, layer, obj_keyboard_inputs_controller);

play_sound(stk_intro, true);

function go_to_next_level() {
	if (level + 1 >= array_length(levels_config)) {
		current_level = {
			speed_increment: current_level.speed_increment + current_level.speed_increment,
			multiplier_increment: current_level.multiplier_increment + current_level.multiplier_increment,
			enemies: current_level.enemies,
			spawn_seconds_range: current_level.spawn_seconds_range,
			collectible_spawn_chance: current_level.collectible_spawn_chance,
			maximum_distance: current_level.maximum_distance + current_level.maximum_distance,
			dash_distance: current_level.dash_distance,
			dash_cooldown_decrement: current_level.dash_cooldown_decrement,
		};
	} else {
		level++;
		current_level = levels_config[level];
	}
	
	flying_speed += current_level.speed_increment;
	multiplier += current_level.multiplier_increment;
	obj_dove.dash_cooldown_ms -= current_level.dash_cooldown_decrement;
}

function terminate() {
	with(obj_record_manager) {
		var _distance = other.distance;
		var _points = _distance + other.extra_points;
		var _poops_hit_count = other.poops_hit_count;
		
		if (_points > best_points) {
			best_points = _points;
			opera_gx_challenge_submit_scorer_challenge(best_points);
		}
		
		if (_distance > best_distance) {
			best_distance = _distance;
			opera_gx_challenge_submit_traveller_challenge(best_distance);
		}
		
		if (_poops_hit_count > best_poops_hit) {
			best_poops_hit = _poops_hit_count;
			opera_gx_challenge_submit_sniper_challenge(best_poops_hit);
		}
		
		distance_description = "further: " + obj_distance_manager.get_distance_display();
		points_description = "best: " +
			string(round(best_distance + best_points)) + "pts";
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
	with (obj_dove) {
		is_flying = true;
		dash_cooldown_ms = STARTING_DASH_COOLDOWN;
	}
	
	with (obj_cliff)
		is_leaving = true;
	
	with (obj_poop_button)
		visible = true;
		
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
	distance = 0;
	extra_points = 0;
	poops_hit_count = 0;
	shown_extra_points = 0;
	level = 0;
	current_level = levels_config[level];
	has_started = true;
	has_ended = false;
}

function start() {
	reset_variables();
	setup_draw();
	setup_objects_on_start();
	
	audio_stop_sound(stk_intro);
	
	if (!audio_is_playing(stk_pomba_beat))
		play_sound(stk_pomba_beat, true);
}