/// @func timer_get_sequence_duration_atpos
/// @arg {map} timer
/// @arg {real} nodePos
/// @desc Get the given node in the sequence's duration.

var _timer = argument[0];
var _nodePos = argument[1];


var _sequence = _timer[? "SEQUENCE"];

return (_nodePos >= timer_get_sequence_size(_timer)) ? _FUWA_EXIT_FAILURE : _sequence[_nodePos,fuwasequence.duration];