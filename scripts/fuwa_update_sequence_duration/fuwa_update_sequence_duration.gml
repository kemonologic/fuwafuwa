/// @func fuwa_update_sequence_duration
/// @arg  {map} timer

var _timer = argument[0];

var _sequence = _timer[? "SEQUENCE"];
var _curNode = timer_get_sequence_curpos(_timer);

_sequence[@ _curNode, fuwasequence.duration] = timer_get_duration(_timer);