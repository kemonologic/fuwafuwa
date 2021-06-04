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

if (is_array(_time)){ // sequence
	for (var i = 0; i < array_length_1d(_time); i++){
		_sequence[i, fuwasequence.duration] = _time[i];
		_sequence[i, fuwasequence.completed] = false;
	}
	_time = _sequence[0, fuwasequence.duration];
}
else{
	_sequence[0, fuwasequence.duration] = _time;
}
	
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

//var _timerTree = global._fuwa_timerTree;
var _instanceList = global._fuwa_instanceList;
var _instanceMap = global._fuwa_instanceMap;

var _gameFPS = _FUWA_OPTIONS_FRAMERATE;

switch (_unit){
	case time.s:
		_time *= 1000;
		//_unit = time.s;
		break;
	case time.msframes:
		_time = (_time / 1000) * _gameFPS;
		//_unit = time.frames;
		break;
	case time.sframes:
		_time = _time * _gameFPS;
		//_unit = time.frames;
		break;
}


var _isFrameLocked = (_unit == time.frames) || (_unit == time.sframes) || (_unit == time.msframes);

var _timeStart = 0;
var _timeEnd = 0;
var _timeCurrent = 0;

_timeStart = _isFrameLocked ? fuwa_get_clockframes() : fuwa_get_clocktime();
_timeEnd = _timeStart + _time;
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
														 "REPEAT", false,
														 "SEQUENCE", _sequence,
														 "SEQUENCE_NODE_CURRENT", 0,
														 "RESTARTED_THIS_FRAME", false,
														 "AUTODESTROY", _autoDestroy);
								 


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