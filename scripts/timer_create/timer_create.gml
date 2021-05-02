/// @func timer_create 
/// @desc {map} Creates a timer and returns a reference.
/// @arg {real} time
/// @arg {enum*} unit
/// @arg {bool*} autoDestroy

var _time = argument[0];
var _unit = time_start.ms;
var _autoDestroy = true;

if (argument_count > 1){
	_unit = argument[1];
}

if (argument_count > 2){
	_autoDestroy = argument[2];
}

var _timerTree = global._fuwa_timerTree;
var _gameFPS = _FUWA_OPTIONS_FRAMERATE;

switch (_unit){
	case time_start.s:
		_time *= 1000;
		_unit = time.ms;
		break;
	case time_start.msframes:
		_time = (_time / 1000) * _gameFPS;
		_unit = time.frames;
		break;
	case time_start.sframes:
		_time = _time * _gameFPS;
		_unit = time.frames;
		break;
}

var _isFrameLocked = (_unit == time.frames);

var _timeStart = 0;
var _timeEnd = 0;
var _timeCurrent = 0;

_timeStart = _isFrameLocked ? fuwa_get_clockframes() : fuwa_get_clocktime();
_timeEnd = _timeStart + _time;
_timeCurrent = _timeStart;

var _timerNode = fuwa_ds_tree_build_node_value(			 "TIME_START", _timeStart,
														 "TIME_CURRENT", _timeCurrent,
														 "TIME_END", _timeEnd,
														 "TIME_EASE_INTERVAL_NEXT", _timeStart,
														 "OWNER", id,
														 "ACTIVE", false,
														 "PAUSED", false,
														 "UNIT", _unit,
														 "TIMES_FINISHED", 0,
														 "EASE_TYPE", easetype.linear,
														 "EASE_CURRENT", 0,
														 "EASE_INTERVAL", 0,
														 "SCRIPT", undefined,
														 "SCRIPT_SCOPE", id,
														 "REPEAT", false,
														 "WAS_RESET", false,
														 "AUTODESTROY", _autoDestroy);
								 
ds_list_add(_timerTree,_timerNode); // don't add as map as we may transfer the references

return _timerNode;