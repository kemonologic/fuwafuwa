/// @func timer_get_ease_interval
/// @desc {real} Returns the ease interval of the timer.
/// @arg  {map} timer

var _timer = argument[0];
return _timer[? "EASE_INTERVAL"];