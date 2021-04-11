/// @func timer_get_ease_type
/// @desc {enum} Returns the ease type of the timer.
/// @arg  {map} timer

var _timer = argument[0];
return _timer[? "EASE_TYPE"];