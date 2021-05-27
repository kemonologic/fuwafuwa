/// @func timer_get_end
/// @desc {real} Returns the end time, in the timer's units.
/// @arg  {map} timer

var _timer = argument[0];
return fuwa_convert_time_toexternal(_timer[? "UNIT"], _timer[? "TIME_END"]);