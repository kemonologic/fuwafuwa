/// @func timer_check
/// @desc {bool} Checks to see if a timer has elapsed. If autodestroy and true, destroys the timer.
/// @arg {map} timer
/// @arg {bool*} suppressDestroy

var _timer = argument[0];
var _suppressDestroy = false;

if (argument_count > 1){
	_suppressDestroy = argument[1];
}

if (is_undefined(_timer)){
	return false;
}

if (!_timer[? "ACTIVE"]){
	return false;
}

var _timerFinished = false;

// Allow "was reset" for cases where a repeating timer was reset before we could timer_check it.
_timerFinished = (_timer[? "TIME_END_INT"] <= _timer[? "TIME_CURRENT_INT"]) || _timer[? "WAS_RESET"];  // fix this

var _destroy = !_suppressDestroy && _timerFinished && timer_get_autodestroy(_timer); 

if (_destroy){
	fuwa_timer_deactivate(_timer);
}

return _timerFinished;