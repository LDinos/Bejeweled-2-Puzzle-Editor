/// @description
if mouse_check_pressed_onme(mb_left) || keyboard_check_pressed(ord("L")) {
	var path = get_open_filename_ext(".bpz Puzzle file|*.bpz", "", "", "Select puzzle file")
	if path != "" read_puzzle(path)
}





