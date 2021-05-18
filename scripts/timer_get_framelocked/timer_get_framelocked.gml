/// @func timer_get_framelocked
/// @desc {bool} Returns whether the timer is based on frames (true) or current_time (false) 
/// @arg  {map} timer

var _timer = argument[0];
var _unit = _timer[? "UNIT"];
return (_unit == time.frames || _unit == time.msframes || _unit == time.sframes);