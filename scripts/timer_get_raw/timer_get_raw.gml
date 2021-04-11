/// @func timer_get_raw
/// @desc {real} Returns the normalized progress of the timer.
/// @arg  {map} timer

var _timer = argument[0];
var _normalizedValue = fuwa_normalize(_timer[? "TIME_CURRENT"], _timer[? "TIME_START"], _timer[? "TIME_END"]);
return _normalizedValue;