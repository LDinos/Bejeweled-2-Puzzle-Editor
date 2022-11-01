/// @description
text_gap = 16
hover = -1
starting_state = 0
set_swap_mode = 0 // 0 = no swap mode, 1 = set first swap, 2 = set second swap
butt_hover = -1
current_hint_newswap = 0 //used to see if we change swap positions or if we make a new hint swap position
show_state_board = false
max_hints_per_page = 10
page = 0 //cant fit all hints, make pages

function page_up() {
	var state = obj_butt_state.state_index
	if state == -1 return;

	if (page > 0) page--

}

function page_down() {
	var state = obj_butt_state.state_index
	if state == -1 return;
	var l = array_length(obj_butt_state.states_array[state])

	if (l-page > (max_hints_per_page/2)) page++
}

function reset_hover() {
	obj_board.hint_arrow = -1
	butt_hover = -1
	hover = -1
}

function add_new_hint(arrow_coords_struct) {
	
	set_swap_mode = 0
	var i1 = "i1" + string(arrow_coords_struct[$ "i1"])
	var i2 = "i2" + string(arrow_coords_struct[$ "i2"])
	var j1 = "j1" + string(arrow_coords_struct[$ "j1"])
	var j2 = "j2" + string(arrow_coords_struct[$ "j2"])
	var arrow_num_raw = ds_map_find_key(obj_board.hint_map, i1+j1+i2+j2)
	if is_undefined(arrow_num_raw) {
		show_message("Arrow positions are wrong or unsupported by the program.\nPlease try to have them next to each other")
	} else {
		audio_play_sound(snd_butt_click,0,false)
		var hint_l = array_length(obj_butt_state.states_array[obj_butt_state.state_index]) //How many hints do we have?
		if (current_hint_newswap >= hint_l) { //new hint
			obj_butt_state.states_array[obj_butt_state.state_index][current_hint_newswap] = {"arrow_pos" : real(arrow_num_raw), "goto" : 0}
		}
		else obj_butt_state.states_array[obj_butt_state.state_index][current_hint_newswap][$ "arrow_pos"] = real(arrow_num_raw) //existing hint
	}
}

