/// @func timer_set_script
/// @desc {void} Sets an optional script to execute when timer is finished.
/// @desc		 Optionally, set the executing instance scope for the script (default: owner)
/// @arg {map} timer
/// @arg {script} executeScript
/// @arg {arr} argumentArray
/// @arg {enum*} eventType
/// @arg {inst*} scopeInstance 

var _timer = argument[0];
var _executeScript = argument[1];
var _argumentArray = argument[2];

var _scopeInstance = _timer[? "OWNER"];
var _eventType = fuwaevent.onComplete;

if (argument_count == 4){
	var _optArg = argument[3];
	if (real(_optArg) >= 100000){ // instance ID
		_scopeInstance = _optArg;
	}
	else{
		_eventType = _optArg;
	}
}
else if (argument_count == 5){
	_scopeInstance = argument[3];
	_eventType = argument[4];
}


switch (_eventType){
	case fuwaevent.onComplete:
		_key = "SCRIPT";
		break;
	case fuwaevent.onResume:
		_key = "SCRIPT_RESUME";
		break;
	case fuwaevent.onHalt:
		_key = "SCRIPT_HALT";
		break;			
}
	

if (!script_exists(_executeScript)){
	if (real(_executeScript) != -1){
		return _FUWA_EXIT_FAILURE;
	}
	else{
		_executeScript = undefined;
		_scopeInstance = id;
		_argumentArray = [];
	}
}

_timer[? _key] = _executeScript;
_timer[? _key + "_SCOPE"] = _scopeInstance;
_timer[? _key + "_ARGUMENTS"] = _argumentArray;