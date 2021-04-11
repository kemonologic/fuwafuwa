/// @func fuwa_timer_deactivate
/// @desc {void} Moves a timer to the deactivated pool.
/// @arg {map} timer

var _timer = argument[0];
var _pos = ds_list_find_index(global._fuwa_timerTree,_timer);

_timer[? "ACTIVE"] = false;

ds_list_delete(global._fuwa_timerTree,_pos);
ds_list_add(global._fuwa_deactivatedTimerTree,_timer);