/// @func timer_set_script
/// @desc {void} Sets an optional script to execute when timer is finished.
/// @desc		 Optionally, set the executing instance scope for the script (default: owner)
/// @arg {map} timer
/// @arg {script} executeScript
/// @arg {arr} argumentArray
/// @arg {inst*} scopeInstance 

var _timer = argument[0];
var _executeScript = argument[1];
var _argumentArray = argument[2];

var _scopeInstance = _timer[? "OWNER"];

if (argument_count > 3){
	_scopeInstance = argument[3];
}

if (!script_exists(_executeScript)){
	return _FUWA_EXIT_FAILURE;
}

_timer[? "SCRIPT"] = _executeScript;
_timer[? "SCRIPT_SCOPE"] = _scopeInstance;
_timer[? "SCRIPT_ARGUMENTS"] = _argumentArray;