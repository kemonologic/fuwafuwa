/// @func fuwa_cleanup
/// @desc {void} Setup for fuwafuwa controller (for destroy/cleanup event)

var _timers = ds_list_size(global._fuwa_timerTree);
for (var i = 0; i < _timers; i++){
	ds_map_destroy(global._fuwa_timerTree[| i]);
}
ds_list_destroy(global._fuwa_timerTree);

_timers = ds_list_size(global._fuwa_deactivatedTimerTree);
for (var j = 0; j < _timers; j++){
	ds_map_destroy(global._fuwa_deactivatedTimerTree[| j]);
}
ds_list_destroy(global._fuwa_deactivatedTimerTree);