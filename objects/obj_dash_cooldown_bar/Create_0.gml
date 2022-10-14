pixel_size = 20;
margin = pixel_size * 2;
cooldown_width = pixel_size * 40;
cooldown_percent = 0;
bar_width = cooldown_width + (pixel_size * 4);
is_visible = false;

function begin_cooldown() {
	cooldown_percent = 0;
	tweening_custom(TWEEN_MODE.PERSIST, "cooldown_percent", 1, obj_dove.dash_cooldown_ms, 
	{
		on_finish: function() {
			if (!obj_game.has_shown_slide_tutorial && instance_exists(obj_dove))
				instance_create_depth(x, y, -999, obj_slide_hand);
			
			with(obj_dove)
				can_dash = true;
		}
	});
}

function load() {
	is_visible = true;
	begin_cooldown();
}

function get_rectangles() {
	var _gui_width = display_get_gui_width();
	var _x = (_gui_width * .5) - (bar_width * .5);
	var _y = obj_container.bbox_top + margin;
	
	var _top = {
		x1: _x,
		y1: _y,
		x2: _x + bar_width,
		y2: _y + pixel_size,
	};
	var _left = {
		x1: _x,
		y1: _top.y2,
		x2: _x + pixel_size,
		y2: _top.y2 + (pixel_size * 3),
	};
	var _right = {
		x1: _x + bar_width - pixel_size,
		y1: _top.y2,
		x2: _x + bar_width,
		y2: _top.y2 + (pixel_size * 3),
	};
	var _bottom = {
		x1: _x,
		y1: _left.y2,
		x2: _x + bar_width,
		y2: _left.y2 + pixel_size,
	};
	
	return { top: _top, left: _left, right: _right, bottom: _bottom };
}

rectangles = get_rectangles();

function get_cooldown_rectangle() {
	var _x = rectangles.left.x2 + pixel_size;
	
	return {
		x1: _x,
		y1: rectangles.top.y2 + pixel_size,
		x2: _x + (cooldown_width * cooldown_percent),
		y2: rectangles.bottom.y1 - pixel_size,
	};
}