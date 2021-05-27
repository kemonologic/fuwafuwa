/// @func timer_get_start
/// @desc {real} Returns the start time, in the timer's units.
/// @arg  {map} timer

var _timer = argument[0];
return fuwa_convert_time_toexternal(_timer[? "UNIT"], _timer[? "TIME_START"]);