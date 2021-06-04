/// @func fuwa_timer_update_ease_interval_next
/// @desc {void} To be run by timer controller.
/// @arg {map} timer

var _timer = argument[0];
if (timer_check(_timer)){
	exit;
}

var _start = _timer[? "TIME_START"];
var _end = _timer[? "TIME_END"];
var _current = _timer[? "TIME_CURRENT"];

var _timeSinceStart = _current - _start;
var _totalTime = _end - _start;

var _intervalDuration = floor(_totalTime / timer_get_ease_interval(_timer));
var _prevInterval = fuwa_mround_min(_timeSinceStart, _intervalDuration);
var _nextInterval = _prevInterval + _intervalDuration + _start;

_timer[? "TIME_EASE_INTERVAL_NEXT"] = _nextInterval;