/// @func timer_get_script
/// @desc {script} Returns the script assigned to the timer for execution when finished.
/// @arg {map} timer
/// @arg {enum*} eventType

var _timer = argument[0];
var _eventType = argument_count > 1 ? argument[1] : fuwaevent.onComplete;
var _key = "SCRIPT";

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

return _timer[? _key];