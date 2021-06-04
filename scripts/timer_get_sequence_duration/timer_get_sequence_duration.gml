/// @func timer_get_sequence_duration
/// @arg {map} timer
/// @desc Get the total sequence duration for the timer.

var _timer = argument[0];

if (timer_get_sequence_size(_timer) == 0){
	return _FUWA_EXIT_FAILURE;
}

var _total = 0;
var _sequence = _timer[? "SEQUENCE"];

for (var i = 0; i < array_height_2d(_sequence); i++){
	_total += _sequence[i,fuwasequence.duration];
}

return _total;