/// @func timer_get_script
/// @desc {script} Returns the script assigned to the timer for execution when finished.
/// @arg {map} timer
/// @arg {script} executeScript

var _timer = argument[0];

return _timer[? "SCRIPT"];