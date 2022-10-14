minimum_waiting_seconds = 2;
maximum_waiting_seconds = 4;
time_source = noone;
collectible = {
	apple: { index: obj_apple, y_range: { min_y: 20, max_y: 20 } }
};
enemy = {
	guy: { index: obj_guy, y_range: noone },
	airplane: { index: obj_airplane, y_range: { min_y: 20, max_y: 240 } },
	glider_guy: { index: obj_glider_guy, y_range: { min_y: 20, max_y: 240 } },
};

function begin_next_spawn_cooldown() {
	var _seconds = irandom_range(minimum_waiting_seconds, maximum_waiting_seconds);
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
	spawn_entity(collectible.apple);
}

function spawn_enemy() {
	spawn_entity(enemy.glider_guy);
}

function spawn() {
	spawn_enemy();
	begin_next_spawn_cooldown();
}

spawn();