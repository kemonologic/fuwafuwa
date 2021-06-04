/// @func timer_get_sequence_curpos
/// @desc {real} Get the position of the current node in the sequence
/// @arg {map} timer

var _timer = argument[0];
return _timer[? "SEQUENCE_NODE_CURRENT"];