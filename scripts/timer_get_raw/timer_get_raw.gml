/// @func timer_get_raw
/// @desc {real} Returns the normalized progress of the timer.
/// @arg  {map} timer

var _timer = argument[0];
var _normalizedValue = fuwa_normalize(_timer[? "TIME_CURRENT_INT"], _timer[? "TIME_START_INT"], _timer[? "TIME_END_INT"]);
return _normalizedValue;