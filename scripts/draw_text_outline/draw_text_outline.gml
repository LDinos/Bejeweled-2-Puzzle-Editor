/// @function draw_text_outline(x, y, text, text_color, outline_width, outline_color, text_alpha)
function draw_text_outline(_x, _y, text, c, w, oc, alpha) {

	draw_text_color(_x-w, _y-w, text, oc,oc,oc,oc, alpha)
	draw_text_color(_x-w, _y+w, text, oc,oc,oc,oc, alpha)
	draw_text_color(_x+w, _y-w, text, oc,oc,oc,oc, alpha)
	draw_text_color(_x+w, _y+w, text, oc,oc,oc,oc, alpha)
	draw_text_color(_x, _y, text, c,c,c,c, alpha)
}