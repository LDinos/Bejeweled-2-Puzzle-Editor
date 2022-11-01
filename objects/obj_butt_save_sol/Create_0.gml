/// @description
event_inherited()
image_xscale = 1.5

function save_solution(path) {
	obj_path_string.solution_path = path
	var states_l =  array_length(obj_butt_state.states_array)
	var buffer = buffer_create(1, buffer_grow, 1)
		/*Header .sol*/
		buffer_write(buffer, buffer_u32, 322416642)
		buffer_write(buffer, buffer_u8, 2)
		/*Header continue */
		buffer_write(buffer, buffer_u32, 2493855488)
		buffer_write(buffer, buffer_u8, 214)
		/* Solution Start */
		buffer_write(buffer, buffer_u8, obj_solution_manager.starting_state+1) //Starting state (starting from 1, not 0)
		buffer_write(buffer, buffer_u8, 0) //>>
		buffer_write(buffer, buffer_u8, states_l+1) //Number of solutions + 1 (it includes the ending as a solution)
		buffer_write(buffer, buffer_u8, 0) //>>
		buffer_write(buffer, buffer_u8, 0) //>>
		/* States */
		for(var i = 0; i < states_l; i++) { //Go through every state
			var hints_l = array_length(obj_butt_state.states_array[i])	
			buffer_write(buffer, buffer_u8, hints_l) //How many hints does this state have?
			for(var j= 0; j < hints_l; j++) { //Hints for the i state (4 bytes each)
				var arrow_pos = obj_butt_state.states_array[i][j][$ "arrow_pos"]
				var goto = obj_butt_state.states_array[i][j][$ "goto"]	
				buffer_write(buffer, buffer_u8, arrow_pos) //Where to point the arrow
				buffer_write(buffer, buffer_u8, goto) //To which state do we go after this move?
				buffer_write(buffer, buffer_u8, 0) // Nothing, just 0
				buffer_write(buffer, buffer_u8, 0) // Nothing, just 0
			}
		}
	buffer_save(buffer, path)
	buffer_delete(buffer)
}



