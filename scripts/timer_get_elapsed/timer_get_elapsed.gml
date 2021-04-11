/// @func timer_get_elapsed
/// @arg  {map} timer
/// @desc {real} Returns time since the start of the timer, in the units set for the timer.

var _timer = argument[0];
return (_timer[? "TIME_CURRENT"] - _timer[? "TIME_START"]);