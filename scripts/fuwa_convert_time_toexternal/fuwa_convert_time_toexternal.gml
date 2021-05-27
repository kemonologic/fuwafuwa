/// @func fuwa_convert_time_toexternal
/// @arg {enum} unit
/// @arg {real} internalTime

var _unit = argument[0];
var _internalTime = argument[1];

if (_FUWA_OPTIONS_USE_BASE_UNITS){
	return _internalTime;
}

switch (_unit){
    case time.ms:
    case time.frames:
        return _internalTime; break;
    case time.s: 
        return (_internalTime * 0.001); break;
    case time.sframes: 
        return (_internalTime / _FUWA_OPTIONS_FRAMERATE); break;
    case time.msframes: 
        return ((_internalTime / _FUWA_OPTIONS_FRAMERATE) * 1000); break;
}