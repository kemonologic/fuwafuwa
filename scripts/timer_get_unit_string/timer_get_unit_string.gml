/// @func timer_get_unit_string
/// @desc {enum} Returns the timer unit as a string.
/// @arg {map} timer
/// @arg {bool*} includeFramelock Include framelock text (default: true)

var _timer = argument[0];
var _includeFramelock = true;
var _framelockString = " (framelocked)";

if (argument_count > 1){
	_includeFramelock = argument[1];
}

var _unit = timer_get_unit(_timer);
switch (_unit){
    case time.ms:
		return "ms"; break;
    case time.frames:
        return "frames"; break;
    case time.s: 
        return "s"; break;
    case time.sframes: 
        var _str = _includeFramelock ? "s" + _framelockString : "s";
		return _str;
		break;
    case time.msframes: 
        var _str = _includeFramelock ? "ms" + _framelockString : "ms";
		return _str;
		break;
}