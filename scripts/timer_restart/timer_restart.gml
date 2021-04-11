/// @func timer_restart
/// @desc {void} Restart the timer's start time to start now.
/// @desc		 The end time is adjusted to keep the timer the same duration.
/// @arg {map} timer

var _timer = argument[0];
var _clock = fuwa_get_timer_clock(_timer);
	
_timer[? "WAS_RESET"] = true;
var _timerInterval = _timer[? "TIME_END"] - _timer[? "TIME_START"];
_timer[? "TIME_START"] = _clock;
_timer[? "TIME_END"] = _clock + _timerInterval;
			
