/// @func timer_check_sequence
/// @arg {map} timer
/// @desc Check to see if the entire sequence has been completed

var _timer = argument[0];
var _numFinished = timer_get_numfinished(_timer);

return (_numFinished >= timer_get_sequence_size(_timer));