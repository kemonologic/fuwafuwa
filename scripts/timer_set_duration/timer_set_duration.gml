/// @func timer_set_duration
/// @desc {void} Change the duration of the timer without affecting the start time.
/// @arg {map} timer
/// @arg {real} duration

var _timer = argument[0];
var _duration = argument[1];

_timer[? "TIME_END"] = _timer[? "TIME_START"] + _duration;


