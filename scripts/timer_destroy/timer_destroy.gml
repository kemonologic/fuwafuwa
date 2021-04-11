/// @func timer_destroy
/// @desc {void} Destroys a timer.
/// @arg {map} timer

var _timer = argument[0];

if (is_undefined(_timer)){
	return;
}
if (!instance_exists(oTimerController)){
	return;
}

var _pos = ds_list_find_index(global._fuwa_timerTree, _timer);
if (_pos != -1){
	ds_list_delete(global._fuwa_timerTree,_pos);
}
var _pos = ds_list_find_index(global._fuwa_deactivatedTimerTree, _timer);
if (_pos != -1){
	ds_list_delete(global._fuwa_deactivatedTimerTree,_pos);
}
ds_map_destroy(_timer);