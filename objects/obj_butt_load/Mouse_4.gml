/// @description
event_inherited()

var path = get_open_filename_ext(".bpz Puzzle file|*.bpz", "", "", "Select puzzle file")
if path != "" read_puzzle(path)



