/// @func fuwa_script_called
/// @arg {bool*} includeLineNum
/// @desc Returns the name of the last script called, can thus be used like id but for scripts

var _includeLineNum = true;
if (argument_count > 0) {
	_includeLineNum = argument[0];
}

var _callStackArr = debug_get_callstack();
//var _excludedScripts = ds_list_create();

// Add scripts to exclude here
var _excludedScriptsArr = ["fuwa_script_called", "fuwa_trace", "script_called", "fTrace", "show_debug_message"];

for (var i = 0; i < array_length_1d(_callStackArr); i++) {
	var _wasExcluded = false;
	var _scr = _callStackArr[i];
	var _scrNice = string_replace(_scr, "gml_Script_", "");
	_scrNice = string_replace(_scrNice, "gml_Object_", "");
	var _scrStrLen = string_length(_scrNice);
	var _scrLineNumIndex = string_pos(":", _scrNice);
	var _scrNoLineNum = string_delete(_scrNice, _scrLineNumIndex, _scrStrLen - _scrLineNumIndex + 1);
	for (var j = 0; j < array_length_1d(_excludedScriptsArr); j++){
		_wasExcluded |= (_excludedScriptsArr[j] == _scrNoLineNum);
	}
	if (!_wasExcluded){
		return _includeLineNum ? _scrNice : _scrNoLineNum;
	}
}