/// @func timer_get_ease
/// @desc {real} Returns the ease value of the timer.
/// @arg  {map} timer

var _timer = argument[0];
return _timer[? "EASE_CURRENT"];