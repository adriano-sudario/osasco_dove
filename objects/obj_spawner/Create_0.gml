time_source = noone;

function begin_next_spawn_cooldown() {
	var _minimum_waiting_seconds = obj_game.current_level.spawn_seconds_range.minimum;
	var _maximum_waiting_seconds = obj_game.current_level.spawn_seconds_range.maximum;
	var _seconds = irandom_range(_minimum_waiting_seconds, _maximum_waiting_seconds);
	time_source = call_later(_seconds, time_source_units_seconds, spawn);
}

function spawn_entity(_entity) {
	with(instance_create_layer(0, 0, layer, _entity.index)) {
		x = display_get_gui_width() + abs(sprite_xoffset);
		
		if (_entity.y_range == noone) {
			y = obj_tap_area.bbox_top - bbox_get_height(self) + bbox_get_yoffset(self);
		} else {
			var _bbox_yoffset = bbox_get_yoffset(self);
			var _min_y = _entity.y_range.min_y + _bbox_yoffset;
			var _bbox_height = bbox_get_height(self);
			var _floor = obj_tap_area.bbox_top;
			var _max_y = _floor - _entity.y_range.max_y - _bbox_height + _bbox_yoffset;
			y = irandom_range(_min_y, _max_y);
		}
	}
}

function spawn_collectible() {
	spawn_entity(obj_game.collectible.apple);
}

function spawn_enemy() {
	var _enemy_index = irandom(array_length(obj_game.current_level.enemies) - 1);
	var _enemy = obj_game.current_level.enemies[_enemy_index];
	spawn_entity(_enemy);
}

function spawn() {
	if (random(1) <= obj_game.current_level.collectible_spawn_chance)
		spawn_collectible();
	else
		spawn_enemy();
	
	begin_next_spawn_cooldown();
}

spawn();