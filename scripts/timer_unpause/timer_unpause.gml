/// @func timer_unpause
/// @desc {void} Unpause a paused timer.
/// @desc		 The end time is adjusted to keep the timer the same duration as when it was paused.
/// @arg {map} timer
/// @arg {bool*} clearRestartFlag

var _timer = argument[0];
var _clearRestartFlag = false;

if (argument_count > 1){
	_clearRestartFlag = argument[1];
}

if (!timer_get_paused(_timer)){
	return _FUWA_EXIT_FAILURE;
}

var _clock = fuwa_get_timer_clock(_timer);
var _timePassed = _clock - _timer[? "TIME_CURRENT"];

_timer[? "TIME_START"] += _timePassed;
_timer[? "TIME_CURRENT"] = _clock;
_timer[? "TIME_END"] += _timePassed;

_timer[? "PAUSED"] = false;

_timer[? "RESTARTED_THIS_FRAME"] = _clearRestartFlag ? false : _timer[? "RESTARTED_THIS_FRAME"];