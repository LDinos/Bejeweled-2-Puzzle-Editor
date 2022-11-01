/// @description
//event_inherited()

audio_play_sound(snd_butt_click2,0,false)
if (obj_butt_state.state_index != -1) {
	array_delete(obj_butt_state.states_array, obj_butt_state.state_index, 1)
	array_delete(obj_board.state_board, obj_butt_state.state_index, 1)
	var l = array_length(obj_butt_state.states_array)
	if (l == 0) { //If we deleted all states
		obj_solution_manager.starting_state = 0
		obj_butt_state.state_index = -1
		obj_solution_manager.show_state_board = false
		obj_solution_manager.page = 0
	}
	else { //Change current state index and starting index just in case
		if (obj_butt_state.state_index >= l) {
			obj_butt_state.state_index = l-1
			obj_solution_manager.page = 0
		}
		if obj_solution_manager.starting_state >= l {
			obj_solution_manager.starting_state = l-1
			obj_solution_manager.page = 0
		}
	}
}

