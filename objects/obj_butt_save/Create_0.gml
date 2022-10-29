/// @description
event_inherited()
image_xscale = 1.5

function save_puzzle(path) {
	/* HEADER */
	var buffer = buffer_create(1, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u32, 54465471)
	buffer_write(buffer, buffer_u32, 1)
	buffer_write(buffer, buffer_u32, 524288)
	buffer_write(buffer, buffer_u32, 2054845776)
	buffer_write(buffer, buffer_u32, 1701667150)
	buffer_write(buffer, buffer_u32, 1968177160)
	buffer_write(buffer, buffer_u32, 1766357626)
	buffer_write(buffer, buffer_u32, 554094)
	buffer_write(buffer, buffer_u32, 1970040659)
	buffer_write(buffer, buffer_u32, 1852795252)
	/* BOARD */
	var i = 0
		while(i < 64) {
			var _i = i div 8
			var _j = i mod 8
			var gem = obj_board.board[_i][_j][$ "gem"]
			var _power = obj_board.board[_i][_j][$ "power"]
			var value = obj_board.board[_i][_j][$ "value"]
			if (gem == EMPTY) buffer_write(buffer, buffer_u8, 255)
			else {
				buffer_write(buffer, buffer_u8, gem)
				buffer_write(buffer, buffer_u8, _power)
				if (gem == BOMB) buffer_write(buffer, buffer_u8, value)
			}
			i++
		}
	buffer_save(buffer, path)
	buffer_delete(buffer)
}




