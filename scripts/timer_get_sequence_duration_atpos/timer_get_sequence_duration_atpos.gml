/// @func timer_get_sequence_duration_atpos
/// @desc {real} Get the given node in the sequence's duration.
/// @arg {map} timer
/// @arg {real} nodePos

var _timer = argument[0];
var _nodePos = argument[1];


var _sequence = _timer[? "SEQUENCE"];

return ((_nodePos < 0 || _nodePos >= timer_get_sequence_size(_timer))) ?
			_FUWA_EXIT_FAILURE : 
			 fuwa_convert_time_toexternal(_timer[? "UNIT"],_sequence[_nodePos,fuwasequence.duration]);