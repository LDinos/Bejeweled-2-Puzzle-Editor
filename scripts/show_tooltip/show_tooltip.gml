/// @function show_tooltip(text, rectangle_color, [x_offset], [y_offset])
function show_tooltip(t, c, xoff = 0, yoff = 0){
	var _x = mouse_x + 8 + xoff
	var _x2 = mouse_x + string_width(t) + 16 + xoff
	var _y = mouse_y - 8 + yoff
	var _y2 = mouse_y + 8 + yoff
	draw_set_halign(fa_left)
	draw_rectangle_color(_x,_y,_x2,_y2, c,c,c,c, false)
	draw_text(mouse_x + 12 + xoff, mouse_y + yoff,t)
	draw_set_halign(fa_middle)
}