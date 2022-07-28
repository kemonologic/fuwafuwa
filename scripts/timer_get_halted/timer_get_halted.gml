/// @func timer_get_halted
/// @desc {script} Returns if timer is halted.
/// @arg {map} timer

var _timer = argument[0];

return _timer[? "PAUSED"];