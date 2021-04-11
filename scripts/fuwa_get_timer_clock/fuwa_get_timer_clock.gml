/// @func fuwa_get_timer_clock
/// @desc {real} Returns the current system clock in the units for the timer
/// @arg {map} timer

var _timer = argument[0];
var _isFrameLocked = timer_get_framelocked(_timer);
return _isFrameLocked ? fuwa_get_clockframes() : fuwa_get_clocktime();