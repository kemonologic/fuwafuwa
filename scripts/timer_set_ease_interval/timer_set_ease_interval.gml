/// @func timer_set_ease_interval
/// @desc {void} Set the timer's ease value intervals - how many "splits" of the timer duration it is updated at. 
/// @desc 0 = every frame
/// @arg {map} timer
/// @arg {real} interval

var _timer = argument[0];
var _interval = argument[1];

_timer[? "EASE_INTERVAL"] = _interval;

// compute next interval
fuwa_timer_update_ease_interval_next(_timer);
