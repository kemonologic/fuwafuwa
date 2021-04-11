/// @func timer_get_duration
/// @arg  {map} timer
/// @desc {real} Returns total duration of the timer

var _timer = argument[0];
return (_timer[? "TIME_END"] - _timer[? "TIME_START"]);