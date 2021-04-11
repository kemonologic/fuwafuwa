/// @func timer_get_paused
/// @desc {script} Returns if timer is paused.
/// @arg {map} timer

var _timer = argument[0];

return _timer[? "PAUSED"];