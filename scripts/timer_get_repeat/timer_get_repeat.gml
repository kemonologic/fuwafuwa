/// @func timer_get_repeat
/// @desc {bool} Returns whether a timer repeats.
/// @arg  {map} timer

var _timer = argument[0];
return _timer[? "REPEAT"];