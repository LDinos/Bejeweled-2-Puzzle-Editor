/// @function script()
/// @description default
/// @param {type} param first parameter
function board_reset(board){
	for(var i = 0; i < 8; i++) for(var j = 0; j < 8; j++) {
		board[i][j] = {"gem" : EMPTY, "power" : 0, "value" : 0}
	}
	return board;
}