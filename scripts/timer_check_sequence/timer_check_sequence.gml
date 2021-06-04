/// @func timer_check_sequence
/// @desc {bool} Check to see if the entire sequence has been completed
/// @arg {map} timer

var _timer = argument[0];
var _sequence = _timer[? "SEQUENCE"];
var _completedNodes = 0;
var _size = array_height_2d(_sequence);

for (var i = 0; i < _size; i++){
	_completedNodes += _sequence[i, fuwasequence.completed];
	// allow one-frame fire for restarted timer
	// if we're checking the current node, the last node was also the current one, and we repeated, add +1
	if  (i == (_size - 1) && 
		 i == _timer[? "SEQUENCE_NODE_LAST"] && 
		 i == _timer[? "SEQUENCE_NODE_CURRENT"] && 
		 _sequence[i, fuwasequence.completed] == false){ 
			 _completedNodes += _timer[? "RESTARTED_THIS_FRAME"]; // allow it to fire on the restart frame
	}
}

return (_completedNodes == _size);