/// @func timer_pause
/// @desc {void} Pause a timer.
/// @desc		 Paused timers will not update their progress, but can be accessed normally.
/// @arg {map} timer

var _timer = argument[0];

if (timer_get_paused(_timer)){
	return _FUWA_EXIT_FAILURE;
}

_timer[? "PAUSED"] = true;

// Run script
if (!is_undefined(_timer[? "SCRIPT_HALT"]) && instance_exists(_timer[? "SCRIPT_HALT_SCOPE"])){
	with (_timer[? "SCRIPT_HALT_SCOPE"]){
		fuwa_script_execute_ext(_timer[? "SCRIPT_HALT"],_timer[? "SCRIPT_HALT_ARGUMENTS"]);
	}
}