/// @func timer_check_sequence
/// @desc {bool} Check to see if the entire sequence has been completed
/// @arg {map} timer

var _timer = argument[0];
var _sequence = _timer[? "SEQUENCE"];
var _completedNodes = 0;

for (var i = 0; i < array_height_2d(_sequence); i++){
	_completedNodes += _sequence[i, fuwasequence.completed];
}

return _completedNodes == array_height_2d(_sequence);