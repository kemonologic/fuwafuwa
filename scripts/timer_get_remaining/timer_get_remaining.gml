/// @func timer_get_remaining
/// @arg {map} timer
/// @desc {real} Returns time until the end of the timer, in the units set for the timer.

var _timer = argument[0];
return (_timer[? "TIME_END"] - _timer[? "TIME_CURRENT"]);