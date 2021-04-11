/// @func fuwa_perc
/// @arg {real} value
/// @arg {real} minBound
/// @arg {real} maxBound

var _value = argument[0];
var _minBound = argument[1];
var _maxBound = argument[2]; 

return (_value - _minBound) / (_maxBound - _minBound) * 100;
