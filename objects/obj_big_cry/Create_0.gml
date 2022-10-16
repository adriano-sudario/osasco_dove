event_inherited();

speed_towards_dove = 2;
minimum_gravity_force = .5;
maximum_gravity_force = 4;
gravity_force = .5;
gravity_force_applied = 0;
is_flipping = false;
has_flipped = false;
starting_force = 0;
initial_force_impulse = 40;
force = 0;
force_increment = .05;
force_applied = 0;
var _center_of_screen = display_get_gui_width() * .5;
x_flip_trigger = irandom_range(_center_of_screen - 150, _center_of_screen + 150);
death_sprite_index = spr_big_cry_dead;
death_image_index = 0;
poop_instance = noone;

function die() {
	with(instance_create_layer(x, y, layer, obj_skate)) {
		is_on_floor = !other.is_flipping;
		move_speed = obj_game.flying_speed + other.speed_towards_dove;
		
		other.sprite_index = spr_big_cry_floor;
		var _bbox_yoffset = bbox_get_yoffset(other);
		var _bbox_height = bbox_get_height(other);
		var _floor = obj_tap_area.bbox_top;
		floor_y_position = _floor - _bbox_height + _bbox_yoffset;
		
		if (other.force_applied > 0)
			force_applied = other.force_applied;
		
		if (is_on_floor)
			sprite_index = spr_skate_floor;
		else
			sprite_index = spr_skate_air;
	}
	
	if (poop_instance != noone)
		instance_destroy(poop_instance);
	
	base_die();
}

function reset_flip_force() {
	starting_force = 0;
	force = 0;
	force_increment = .05;
	force_applied = 0;
}

function set_flip_force() {
	y -= initial_force_impulse;
	
	if (poop_instance != noone)
		poop_instance.y -= initial_force_impulse;
	
	gravity_force = random_range(minimum_gravity_force, maximum_gravity_force);
	force_increment = gravity_force / 10;
	starting_force = gravity_force;
	force = -gravity_force;
}
	
function flip() {
	if (is_flipping)
		return;
	
	is_flipping = true;
	reset_flip_force();
	set_flip_force();
	sprite_index = spr_big_cry_flip;
}

function get_back_to_the_floor() {
	sprite_index = spr_big_cry_floor;
	image_index = 1;
	var _bbox_yoffset = bbox_get_yoffset(self);
	var _bbox_height = bbox_get_height(self);
	var _floor = obj_tap_area.bbox_top;
	y = _floor - _bbox_height + _bbox_yoffset;
	
	if (poop_instance != noone)
		poop_instance.y = _floor - _bbox_height + _bbox_yoffset;
}

function end_flip() {
	is_flipping = false;
	has_flipped = true;
	get_back_to_the_floor();
}

function update_movement() {
	base_update_movement();
	
	if (!is_flipping && !has_flipped && x <= x_flip_trigger) {
		flip();
		return;
	}
	
	if (is_flipping) {
		force += force_increment;

		if (force > starting_force)
			force = starting_force;

		force_applied += force;
		y += force_applied;
		
		if (poop_instance != noone)
			poop_instance.y += force_applied;

		if (image_index < 2)
			image_index = 2;
		
		if (bbox_bottom > obj_tap_area.bbox_top) {
			end_flip();
		}
	}
}