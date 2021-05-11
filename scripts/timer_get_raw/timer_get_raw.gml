/// @func timer_get_raw
/// @desc {real} Returns the normalized progress of the timer.
/// @arg  {map} timer

var _timer = argument[0];
return _timer[? "TIME_NORM_INT"];