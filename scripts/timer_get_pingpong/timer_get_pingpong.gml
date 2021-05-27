/// @func timer_get_pingpong
/// @desc {void} Gets the optional ping-pong type set.
/// @arg {map} timer
/// @arg {enum} pingpongType

var _timer = argument[0];
return _timer[? "PINGPONG_TYPE"];
