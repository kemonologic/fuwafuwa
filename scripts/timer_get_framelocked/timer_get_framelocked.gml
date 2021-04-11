/// @func timer_get_framelocked
/// @desc {bool} Returns whether the timer is based on frames (true) or current_time (false) 
/// @arg  {map} timer

var _timer = argument[0];
return (_timer[? "UNIT"] == time.frames);