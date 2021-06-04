/// @func timer_check
/// @desc {bool} Checks to see if a timer has elapsed. If autodestroy and true, destroys the timer.
/// @arg {map} timer
/// @arg {real*} nodePos

var _timer = argument[0];

if (is_undefined(_timer)){
	return false;
}

var _nodePos = -1;
if (argument_count > 1){
	_nodePos = argument[1];
}



/*if (!_timer[? "ACTIVE"]){
	return false;
}*/

var _timerFinished = false;

if (_nodePos == -1){
	_timerFinished = (_timer[? "TIME_END"] <= _timer[? "TIME_CURRENT"]) || _timer[? "RESTARTED_THIS_FRAME"];  // fi
}
else{
	var _sequence = _timer[? "SEQUENCE"];
	_timerFinished = _sequence[_nodePos, fuwasequence.completed];
}

return _timerFinished;