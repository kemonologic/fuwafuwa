/// @func timer_get_sequence_size
/// @arg {map} timer
/// @desc Get the number of nodes in the sequence

var _timer = argument[0];
return array_length_1d(_timer[? "SEQUENCE"]);