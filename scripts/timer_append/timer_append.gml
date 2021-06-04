/// @func timer_append
/// @desc Append additional time nodes to a timer's sequence
/// @arg {map} timer
/// @arg {real} time1
/// @arg {real*} time2...


var _timer = argument[0];
var _sequence = _timer[? "SEQUENCE"];
var _sequenceSize = timer_get_sequence_size(_timer);

for (var i = 1; i < argument_count; i++){
    _sequence[_sequenceSize + (i - 1),fuwasequence.duration] = real(argument[i]);
    _sequence[_sequenceSize + (i - 1),fuwasequence.completed] = false;
}

_timer[? "SEQUENCE"] = _sequence;