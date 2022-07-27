/// @func timer_resume
/// @desc {void} Resume a paused or stopped timer.
/// @desc		 The end time is adjusted to keep the timer the same duration as when it was paused.
/// @arg {map} timer
/// @arg {bool*} clearRepeatFlag

var _timer = argument[0];
var _clearRepeatFlag = false;

if (argument_count > 1){
	_clearRepeatFlag = argument[1];
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

_timer[? "REPEATED_THIS_FRAME"] = _clearRepeatFlag ? false : _timer[? "REPEATED_THIS_FRAME"];

// Run script
if (!is_undefined(_timer[? "SCRIPT_RESUME"]) && instance_exists(_timer[? "SCRIPT_RESUME_SCOPE"])){
	with (_timer[? "SCRIPT_RESUME_SCOPE"]){
		fuwa_script_execute_ext(_timer[? "SCRIPT_RESUME"],_timer[? "SCRIPT_RESUME_ARGUMENTS"]);
	}
}