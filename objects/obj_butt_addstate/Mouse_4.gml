/// @description
event_inherited()
var l = array_length(obj_butt_state.states_array)
if (l < 255) {
	var state_board = []
	obj_board.state_board[l] = board_reset(state_board)
	obj_butt_state.states_array[l] = []
	if (l == 0) { //Is this the first state ever?
		obj_solution_manager.starting_state = 0
	}
	obj_butt_state.state_index = l
	obj_solution_manager.page = 0
}

