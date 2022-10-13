if (!is_visible)
	return;

draw_rectangle(rectangles.top.x1, rectangles.top.y1, rectangles.top.x2, rectangles.top.y2, false);
draw_rectangle(rectangles.left.x1, rectangles.left.y1, rectangles.left.x2, rectangles.left.y2, false);
draw_rectangle(rectangles.right.x1, rectangles.right.y1, rectangles.right.x2, rectangles.right.y2, false);
draw_rectangle(rectangles.bottom.x1, rectangles.bottom.y1, rectangles.bottom.x2, rectangles.bottom.y2, false);

var _cooldown_rectangle = get_cooldown_rectangle();
draw_rectangle(
	_cooldown_rectangle.x1, _cooldown_rectangle.y1, _cooldown_rectangle.x2, _cooldown_rectangle.y2, false,
);