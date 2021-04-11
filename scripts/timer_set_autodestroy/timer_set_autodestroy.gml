/// @func timer_set_autodestroy
/// @desc {void} Sets whether the timer will be destroyed when the timer is finished and been checked at least once.
/// @arg {map} timer
/// @arg {bool} autoDestroy

var _timer = argument[0];
var _autoDestroy = argument[1];

_timer[? "AUTODESTROY"] = _autoDestroy;