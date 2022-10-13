minimum_waiting_seconds = 1;
maximum_waiting_seconds = 3;
time_source = noone;
collectible = {
	apple: { index: obj_apple, min_y: 20, max_y: 20 }
};

function begin_next_spawn_cooldown() {
	var _seconds = irandom_range(minimum_waiting_seconds, maximum_waiting_seconds);
	time_source = call_later(_seconds, time_source_units_seconds, spawn);
}

function spawn_collectible() {
	var _instance = instance_create_layer(0, 0, layer, collectible.apple.index);
	_instance.x = display_get_gui_width() + _instance.sprite_xoffset;
	var _min_y = collectible.apple.min_y + _instance.sprite_yoffset;
	var _instance_height = _instance.bbox_bottom - _instance.bbox_top;
	var _max_y = obj_void.bbox_top - collectible.apple.max_y -
		_instance_height + _instance.sprite_yoffset;
	_instance.y = irandom_range(_min_y, _max_y);
}

function spawn_enemy() {
	
}

function spawn() {
	spawn_collectible();
	begin_next_spawn_cooldown();
}

spawn();