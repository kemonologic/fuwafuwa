/// @func timer_get_ease
/// @desc {real} Returns the ease value of the timer.
/// @arg  {map} timer
/// @arg  {bool*} overridePingpong

var _timer = argument[0];
var _overridePingpong = false;

if (argument_count > 1){
	_overridePingpong = argument[1];
}

var _value = _timer[? "EASE_CURRENT"];

if (_overridePingpong){
	return _value;
}

switch(timer_get_pingpong(_timer)){ 
	case pingpongtype.none: 
		return _value; break;
	case pingpongtype.invertOnEven: 
		var _numFinished = timer_get_numfinished(_timer);
		return (_numFinished % 2 == 0) ? 1 - _value : _value; break;
	case pingpongtype.invertOnOdd: 
		var _numFinished = timer_get_numfinished(_timer);
		return (_numFinished % 2 == 0) ?  _value : 1 - _value; break;
}