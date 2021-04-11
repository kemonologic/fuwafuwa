/// @func timer_pause
/// @desc {void} Pause a timer.
/// @desc		 Paused timers will not update their progress, but can be accessed normally.
/// @arg {map} timer

var _timer = argument[0];

if (timer_get_paused(_timer)){
	return _FUWA_EXIT_FAILURE;
}

_timer[? "PAUSED"] = true;