/// @func timer_set_script
/// @desc {void} Sets an optional script to execute when timer is finished.
/// @arg {map} timer
/// @arg {script} executeScript

var _timer = argument[0];
var _executeScript = argument[1];

if (!script_exists(_executeScript)){
	return _FUWA_EXIT_FAILURE;
}

_timer[? "SCRIPT"] = _executeScript;