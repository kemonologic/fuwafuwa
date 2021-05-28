/// @func timer_set_pingpong
/// @desc {void} Sets an optional ping-pong type, allowing inversion of values on a repeating timer
/// @arg {map} timer
/// @arg {enum} pingpongType

var _timer = argument[0];
var _pingpongType = argument[1];

_timer[? "PINGPONG_TYPE"] = _pingpongType;
