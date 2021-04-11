/// @func fuwa_clean_deactivated
/// @desc {void} To be run by timer controller.

var _timers = ds_list_size(global._fuwa_deactivatedTimerTree);
var _newTree = ds_list_create(); 

for (var i = 0; i < _timers; i++){
	var _timer = global._fuwa_deactivatedTimerTree[| i];
	if (instance_exists(_timer[? "OWNER"])){ // don't prune
		ds_list_add(_newTree,_timer);
	}
	else{
		ds_map_destroy(_timer);
	}
}

var _oldTree = global._fuwa_deactivatedTimerTree;
global._fuwa_deactivatedTimerTree = _newTree;
ds_list_destroy(_oldTree);