/// @description
var _ystart = y + 16
var _yend = y + sprite_height - 24
var _xstart = x - (sprite_width/2) + 16
var _xend = x + (sprite_width/2) - 16

var buttalpha_arrowpos = 0.3 // 0.0 -> 0.5 is button for arrow_position
var buttalpha_state = 0.9 // 0.4 -> 0.85 is button for goto state
var buttalpha_delete = 1 // 0.85 -> 1.0 is button for hint delete

if (set_swap_mode > 0) exit;

var state = obj_butt_state.state_index
var new_butt_hover = false
hover = (mouse_y - _ystart) div text_gap
if (state != -1) {
	if (mouse_x > _xstart && mouse_x < _xend) && (mouse_y > _ystart && mouse_y < _yend) {
		var l = array_length(obj_butt_state.states_array[state])	
		if (hover < l) {
			/* Horizontal hover */
			var x_offset = mouse_x - _xstart
			var alpha = x_offset / (_xend - _xstart)
			if (alpha < buttalpha_arrowpos) butt_hover = 0
			else if (alpha < buttalpha_state) butt_hover = 1
			else if (alpha < buttalpha_delete) butt_hover = 2
			else butt_hover = -1
			var arrow_pos_raw = obj_butt_state.states_array[state][hover][$ "arrow_pos"]
			obj_board.hint_arrow = obj_board.hint_swap_get_coords(arrow_pos_raw)
		} else if (hover == l) {
			butt_hover = -1
			obj_board.hint_arrow = -1
			new_butt_hover = true
		} else reset_hover()
		
		if mouse_check_button_pressed(mb_left) {
			if (new_butt_hover) {
				if (l < 14) {
					set_swap_mode = 1
					current_hint_newswap = array_length(obj_butt_state.states_array[obj_butt_state.state_index])
				} else show_message("For now only 14 hints are allowed per state!")
			} else if hover != -1 {
				if (butt_hover == 0) { //change arrow pos
					set_swap_mode = 1
					current_hint_newswap = hover
				} else if (butt_hover == 1) { //change goto state
					var goto = get_integer("Type goto state (0 = finish)", 0);
					if is_real(goto) {
						if (goto <= 255) obj_butt_state.states_array[state][hover][$ "goto"] = goto
					}
				} else if (butt_hover == 2) { //delete hint
					array_delete(obj_butt_state.states_array[state], hover, 1)
					reset_hover()
				}
				//get mouse_x position so that we can see if user wants to change swap arrow or goto.
			}
		}
	}
	else reset_hover()
} else reset_hover()





