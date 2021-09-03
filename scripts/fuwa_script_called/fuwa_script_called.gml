/// @func fuwa_script_called
/// @arg {bool*} includeLineNum
/// @desc Returns the name of the last script called, can thus be used like id but for scripts

var _includeLineNum = true;
if (argument_count > 0) {
	_includeLineNum = argument[0];
}

var _callStackArr = debug_get_callstack();
var _excludedScripts = ds_list_create();

// Add scripts to exclude here
ds_list_add(_excludedScripts, "fuwa_script_called","script_called", "fTrace", "fuwa_trace", "show_debug_message");

for (var i = 0; i < array_length_1d(_callStackArr); i++) {
	var _wasExcluded = false;
	var _scr = _callStackArr[i];
	var _scrNice = string_replace(_scr, "gml_Script_", "");
	_scrNice = string_replace(_scrNice, "gml_Object_", "");
	var _scrStrLen = string_length(_scrNice);
	var _scrLineNumIndex = string_pos(":", _scrNice);
	var _scrNoLineNum = string_delete(_scrNice, _scrLineNumIndex, _scrStrLen - _scrLineNumIndex + 1);
	_wasExcluded = (ds_list_find_index(_excludedScripts, _scrNoLineNum) != -1);
	
	if (!_wasExcluded) {
		return _includeLineNum ? _scrNice : _scrNoLineNum;
	}
}

ds_list_destroy(_excludedScripts);