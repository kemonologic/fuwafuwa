/// @func timer_get_sequence_duration
/// @arg {map} timer
/// @arg {real} nodeIndex
/// @desc Get the given node in the sequence's duration.

var _timer = argument[0];
var _nodeIndex = argument[1];
var _sequence = _timer[? "SEQUENCE"];

return (_nodeIndex >= timer_get_sequence_size(_timer)) ? _FUWA_EXIT_FAILURE : _sequence[_nodeIndex];