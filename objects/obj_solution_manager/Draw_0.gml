/// @description
draw_self()
var _x = x - sprite_width/2 + 24
var _y = y + 24
var xend = _x + sprite_width-32
var buttalpha_arrowpos = 0.3 // 0.0 -> 0.5 is button for arrow_position
var buttalpha_state = 0.9 // 0.4 -> 0.85 is button for goto state
var buttalpha_delete = 1 // 0.85 -> 1.0 is button for hint delete

var state = obj_butt_state.state_index

draw_set_halign(fa_left)
if (hover != -1) {
	var a = 0.4
	draw_sprite_ext(spr_pixel,0,_x-8, _y-8 + text_gap*hover, sprite_width-32, 16, 0, c_white, a)
	if (butt_hover != -1) {
		var dist = xend - _x
		var x1;
		var s;
		if (butt_hover == 0) {x1 = _x; s = dist*buttalpha_arrowpos}
		else if (butt_hover == 1) {x1 = _x + dist*buttalpha_arrowpos; s = dist*buttalpha_state - dist*buttalpha_arrowpos}
		else if (butt_hover == 2) {x1 = _x + dist*buttalpha_state; s = dist - dist*0.9}
		draw_sprite_ext(spr_pixel,0,x1-8,_y-8 + text_gap*hover, s, 16, 0, c_orange, a)
	}
}
if (state != -1) {
	var l = array_length(obj_butt_state.states_array[state])	 //number of hints in this state
	var i_real = 0
	for(var i = page; i < page + max_hints_per_page; i++) {	
		i_real = i - page //i iterrator without the page value
		if (i == l) break;
		var goto = obj_butt_state.states_array[state][i][$ "goto"]
		var t1 = "Hint " + string(i+1) + ": " + string(obj_butt_state.states_array[state][i][$ "arrow_pos"])
		var t2 = " | Go to state: " + string(goto)
		if (goto == 0) t2 += " (Finish)"
		draw_text(_x, _y + text_gap*i_real, t1 + t2)
		draw_text(xend-40, _y + text_gap*i_real, "[-]")
	}
	if (i != page + max_hints_per_page) draw_text(_x, _y + text_gap*i_real, "+ ADD NEW HINT +")
	
	var info_y = y + sprite_height - 24
	draw_sprite_ext(spr_pixel,0,_x-8,info_y-8, sprite_width-32, 16, 0, c_black, 0.6)
	draw_text(_x, info_y, "Starting state: " + string(starting_state+1) + " |  Number of States: " + string(array_length(obj_butt_state.states_array)))
}
draw_set_halign(fa_center)

if (set_swap_mode > 0) {
	draw_sprite_ext(spr_pixel,0,x-sprite_width/2,y,sprite_width,sprite_height,0,c_black,0.6)
	draw_text(x, y + sprite_height/2, "Set hint arrow " + string(set_swap_mode))
}

if (hover != -1) {
	if (butt_hover == 1) {
		show_tooltip("LMB: Change goto | RMB: Go there", c_black, 0, 32)
	}
}
