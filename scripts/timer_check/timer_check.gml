/// @func timer_check
/// @desc {bool} Checks to see if a timer has elapsed. If autodestroy and true, destroys the timer.
/// @arg {map} timer

var _timer = argument[0];

if (is_undefined(_timer)){
	return false;
}

/*if (!_timer[? "ACTIVE"]){
	return false;
}*/

var _timerFinished = false;

// Allow "was reset" for cases where a repeating timer was reset before we could timer_check it.
_timerFinished = (_timer[? "TIME_END"] <= _timer[? "TIME_CURRENT"]) || _timer[? "WAS_RESET"];  // fix this

return _timerFinished;