/// @description
event_inherited()
image_xscale = 1.5

function load_solution(path) {
	obj_path_string.solution_path = path
	obj_solution_manager.starting_state = 0
	obj_butt_state.state_index = -1
	obj_butt_state.states_array = []
	obj_board.state_board = []
	obj_solution_manager.page = 0
	var board = []
	var file = file_bin_open(path, 0)
	file_bin_seek(file, 10) //which state is first used to start the puzzle with
	obj_solution_manager.starting_state = file_bin_read_byte(file) - 1
	file_bin_seek(file, 12) //all solutions, including the winning one
	var num_solutions = file_bin_read_byte(file) 
	file_bin_seek(file, 15)
	var state_num = 0
	while(file_bin_position(file) < file_bin_size(file)) {
		var state_solutions = file_bin_read_byte(file)
		for(var hint = 0; hint < state_solutions; hint++) {
			var arrow_pos = file_bin_read_byte(file)
			var goto_state = file_bin_read_byte(file)
			file_bin_read_byte(file)
			file_bin_read_byte(file)
			obj_butt_state.states_array[state_num][hint] = {"arrow_pos" : arrow_pos, "goto" : goto_state, "board" : board_reset(board)}
		}
		obj_board.state_board[state_num] = board_reset([])
		state_num++
	}
	obj_butt_state.state_index = obj_solution_manager.starting_state
	file_bin_close(file)
	audio_play_sound(snd_butt_click,0,false)
}



