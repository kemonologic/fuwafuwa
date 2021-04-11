/// @func timer_get_autodestroy
/// @desc {void} Gets whether the timer will be destroyed when the timer is finished and been checked at least once.
/// @arg {map} timer
/// @arg {bool} autodestroy

var _timer = argument[0];

return _timer[? "AUTODESTROY"];