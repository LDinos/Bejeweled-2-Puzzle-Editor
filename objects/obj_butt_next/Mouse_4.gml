/// @description
event_inherited()

if (obj_butt_state.state_index != -1) {
	obj_butt_state.state_index++
	if (obj_butt_state.state_index >= array_length(obj_butt_state.states_array)) obj_butt_state.state_index = 0
}

