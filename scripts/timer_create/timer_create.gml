/// @func timer_create 
/// @desc {map} Creates a timer and returns a reference.
/// @arg {real/arr} time
/// @arg {enum*} unit
/// @arg {bool*} autoDestroy

var _time = argument[0];
var _unit = time.ms;
var _autoDestroy = true;
var _sequence;
_sequence[0, fuwasequence.duration] = 0;
_sequence[0, fuwasequence.completed] = false;


	
if (argument_count > 1){
	var _argument = argument[1];
	if (_argument >= time.frames){
		_unit = argument[1];
	}
	else{
		_autoDestroy = argument[1];
	}
}

if (argument_count > 2){
	_autoDestroy = argument[2];
}

if (_FUWA_OPTIONS_DISABLE_AUTODESTROY){
	_autoDestroy = false;
}


// Force time to always be an array for cleaner code
if (!is_array(_time)){
	var _tmpArr; 
	_tmpArr[0] = _time;
	_time = _tmpArr;
}

// Convert to internal units and set up sequence
var _gameFPS = _FUWA_OPTIONS_FRAMERATE;
for (var i = 0; i < array_length_1d(_time); i++){
	switch (_unit){
		case time.s:
			_time[i] *= 1000;
			break;
		case time.msframes:
			_time[i] = (_time[i] / 1000) * _gameFPS;
			break;
		case time.sframes:
			_time[i] = _time[i] * _gameFPS;
			break;
	}
	_sequence[i, fuwasequence.duration] = _time[i];
	_sequence[i, fuwasequence.completed] = false;
}

var _isFrameLocked = (_unit == time.frames) || (_unit == time.sframes) || (_unit == time.msframes);

var _timeStart = 0;
var _timeEnd = 0;
var _timeCurrent = 0;

_timeStart = _isFrameLocked ? fuwa_get_clockframes() : fuwa_get_clocktime();
_timeEnd = _timeStart + _time[0];
_timeCurrent = _timeStart;

var _timerNode = fuwa_ds_tree_build_node_value(			 
														 "TIME_START", _timeStart,
														 "TIME_CURRENT", _timeCurrent,
														 "TIME_END", _timeEnd,
														 "TIME_NORM", 0,
														 "TIME_EASE_INTERVAL_NEXT", _timeStart,
														 "OWNER", id,
														 "ACTIVE", false,
														 "PAUSED", false,
														 "UNIT", _unit,
														 "TIMES_FINISHED", 0,
														 "PINGPONG_TYPE", pingpongtype.none,
														 "EASE_TYPE", easetype.linear,
														 "EASE_CURRENT", 0,
														 "EASE_INTERVAL", 0,
														 "SCRIPT", undefined,
														 "SCRIPT_SCOPE", id,
														 "SCRIPT_ARGUMENTS", [],
														 "SCRIPT_RESUME", undefined,
														 "SCRIPT_RESUME_SCOPE", id,
														 "SCRIPT_RESUME_ARGUMENTS", [],
														 "SCRIPT_HALT", undefined,
														 "SCRIPT_HALT_SCOPE", id,
														 "SCRIPT_HALT_ARGUMENTS", [],
														 "REPEAT", false,
														 "SEQUENCE", _sequence,
														 "SEQUENCE_NODE_CURRENT", 0,
														 "SEQUENCE_NODE_LAST", 0,
														 "REPEATED_THIS_FRAME", false,
														 "AUTODESTROY", _autoDestroy);
								 


var _instanceList = global._fuwa_instanceList;
var _instanceMap = global._fuwa_instanceMap;
var _instanceNode = undefined;
var _timerList = undefined;
if (!ds_map_exists(_instanceMap,id)){
	_instanceNode = fuwa_ds_tree_build_node_value("INSTANCE",id,"NUM_AUTODESTROY",_autoDestroy);
	_timerList = ds_list_create();
	ds_map_add_list(_instanceNode,"TIMER_LIST",_timerList);
	ds_list_add(_instanceList,_instanceNode);
	ds_list_mark_as_map(_timerList, ds_list_size(_timerList) - 1);
	ds_map_add(_instanceMap,id,_instanceNode);
}
else{
	_instanceNode = _instanceMap[? id];
	_instanceNode[? "NUM_AUTODESTROY"] += _autoDestroy;
	_timerList = _instanceNode[? "TIMER_LIST"];
}

fuwa_assert(!is_undefined(_timerList),"Timer list is undefined");
ds_list_add(_timerList,_timerNode);
ds_list_mark_as_map(_timerList, ds_list_size(_timerList) - 1);

return _timerNode;