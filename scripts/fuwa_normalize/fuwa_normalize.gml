/// @func fuwa_normalize
/// @arg {real} value
/// @arg {real} minBound
/// @arg {real} maxBound

var _value = argument[0];
var _minBound = argument[1];
var _maxBound = argument[2];

if (_value <= _minBound){
	return 0;
}
if (_value >= _maxBound){
	return 1;
}

var _norm = (_value - _minBound) / (_maxBound - _minBound);
return clamp(_norm,0,1);