	/// @func timer_set_repeat
/// @desc {void} Sets a timer to repeat or not, meaning it will be reset back to zero when it goes off.
/// @desc		  If a timer repeats, AUTODESTROY will be ignored.
/// @arg {map} timer
/// @arg {bool} repeat

var _timer = argument[0];
var _repeat = argument[1];

_timer[? "REPEAT"] = _repeat;
