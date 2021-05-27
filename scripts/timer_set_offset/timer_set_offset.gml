/// @func timer_set_offset
/// @desc {void} Start the timer some amount of time from now, in whatever unit the timer has.
/// @desc		  This does not affect the end time.
/// @arg {map} timer
/// @arg {real} offset

var _timer = argument[0];
var _offset = argument[1];

_timer[? "TIME_START"] = _timer[? "TIME_START"] + fuwa_convert_time_tointernal(_timer[? "UNIT"], _offset);
