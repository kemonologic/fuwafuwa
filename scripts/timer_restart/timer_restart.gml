/// @func timer_restart
/// @desc {void} Restart the timer's start time to start now.
/// @desc		 The end time is adjusted to keep the timer the same duration.
/// @arg {map} timer

var _timer = argument[0];
var _clock = fuwa_get_timer_clock(_timer);
//var _timerInterval = __timer[? "TIME_END"] - _timer[? "TIME_START"];
var _timerInterval = 0;

var _sequence = _timer[? "SEQUENCE"];

var _currentNode = _timer[? "SEQUENCE_NODE_CURRENT"];
_timerInterval = _sequence[_currentNode,fuwasequence.duration];

_timerInterval = fuwa_convert_time_tointernal(_timer[? "UNIT"], _timerInterval); 

_timer[? "TIME_START"] = _clock;
_timer[? "TIME_END"] = _clock + _timerInterval;
_timer[? "TIME_NORM"] = 0;
_timer[? "EASE_CURRENT"] = 0;
_timer[? "ACTIVE"] = true;
			
