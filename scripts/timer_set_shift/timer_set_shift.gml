/// @func timer_set_shift
/// @desc {void} Start the timer some amount of time from now, in whatever unit the timer has.
/// @desc		  This affects the end timer.
/// @arg {map} timer
/// @arg {real} shift

var _timer = argument[0];
var _shift = argument[1];

_timer[? "TIME_START"] = _timer[? "TIME_START"] + fuwa_convert_time_tointernal(_timer[? "UNIT"],_shift);
_timer[? "TIME_END"] = _timer[? "TIME_END"] + fuwa_convert_time_tointernal(_timer[? "UNIT"],_shift);


