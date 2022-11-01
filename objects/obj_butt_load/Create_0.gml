/// @description
event_inherited()
image_xscale = 1.5

function read_puzzle(path) {
	obj_path_string.puzzle_path = path
	var file = file_bin_open(path, 0)
		file_bin_seek(file, 4) //This val tells us if 07 is bomb or 07 is rock (08 is rock or 08 is bomb)
		var bomb_is = file_bin_read_byte(file)
		//show_debug_message(bomb_is)
		var _bomb = (bomb_is == 1) ? BOMB : 8
		file_bin_seek(file, 40);
		var i = 0
		while(i < 64) {
			var _i = i div 8
			var _j = i mod 8
			var gem = file_bin_read_byte(file)
			if (gem != 255) { //If not empty
				obj_board.board[_i][_j][$ "gem"] = gem
				var _power = file_bin_read_byte(file)
				obj_board.board[_i][_j][$ "power"] = _power
				if (gem == _bomb) {
					var value = file_bin_read_byte(file)
					obj_board.board[_i][_j][$ "value"] = value
					obj_board.board[_i][_j][$ "gem"] = BOMB
				} 
				else { //if we are not bomb
					obj_board.board[_i][_j][$ "value"] = 0
					if (gem == BOMB) obj_board.board[_i][_j][$ "gem"] = ROCK //if we have the skin of bomb due to bomb_is value, return me to rock
				}
			} 
			else obj_board.board[_i][_j][$ "gem"] = EMPTY
			i++
		}
	file_bin_close(file)
	audio_play_sound(snd_butt_click,0,false)
}




