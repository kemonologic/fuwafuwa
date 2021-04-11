/// @func timer_set_ease_type
/// @desc {void} Sets an optional easing type for the timer.
/// @arg {map} timer
/// @arg {enum} easeType

var _timer = argument[0];
var _easeType = argument[1];

_timer[? "EASE_TYPE"] = _easeType;
