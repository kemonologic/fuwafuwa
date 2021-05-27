/// @func fuwa_convert_time_tointernal
/// @arg {enum} unit
/// @arg {real} externalTime

var _unit = argument[0];
var _externalTime = argument[1];
var _gameFPS = _FUWA_OPTIONS_FRAMERATE;

if (_FUWA_OPTIONS_USE_BASE_UNITS){
	return _externalTime;
}

switch (_unit){
	case time.ms:
    case time.frames:
        return _externalTime; break;
    case time.s:
        return (_externalTime * 1000); break;
    case time.sframes:
        return (_externalTime * _gameFPS); break;
	case time.msframes:
        return (_externalTime * 0.001) * _gameFPS; break;
}