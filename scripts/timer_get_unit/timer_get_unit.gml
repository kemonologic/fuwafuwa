/// @func timer_get_unit
/// @desc {enum} Returns the timer unit.
/// @arg  {map} timer

var _timer = argument[0];
return _timer[? "UNIT"];