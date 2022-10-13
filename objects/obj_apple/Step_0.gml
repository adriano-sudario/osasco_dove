x -= obj_game.flying_speed;

if (x - (bbox_right - bbox_left) + sprite_xoffset < 0)
	instance_destroy();