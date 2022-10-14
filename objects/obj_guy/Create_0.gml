event_inherited();

death_image_index = 1;
poop_instance = noone;

function die() {
	base_die();
	
	if (poop_instance != noone)
		instance_destroy(poop_instance);
}