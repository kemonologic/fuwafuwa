/// @func timer_restart
/// @desc {void} Restart the timer's start time to start now.
/// @desc		 The end time is adjusted to keep the timer the same duration.
/// @arg {map} timer

var _timer = argument[0];
var _clock = fuwa_get_timer_clock(_timer);
//var _timerInterval = __timer[? "TIME_END"] - _timer[? "TIME_START"];
var _timerInterval = 0;

var _sequence = _timer[? "SEQUENCE"];
var _sequenceSize = timer_get_sequence_size(_timer);
var _numFinished = timer_get_numfinished(_timer);

if (_numFinished >= _sequenceSize){
	_timerInterval = _sequence[_sequenceSize - 1]; // Use last node in sequence
}
else{
	_timerInterval = _sequence[_numFinished]; // Use next node in sequence
}

_timer[? "WAS_RESET"] = true;

_timer[? "TIME_START"] = _clock;
_timer[? "TIME_END"] = _clock + _timerInterval;
_timer[? "TIME_NORM"] = 0;
_timer[? "EASE_CURRENT"] = 0;
_timer[? "ACTIVE"] = true;
			
