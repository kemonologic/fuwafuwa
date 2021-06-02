/// @func fuwa_assert
/// @arg {bool} condition
/// @arg {string} message
/// @arg {string} message2...

var _condition = argument[0];
var _message = argument[1];

for (var i = 1; i < argument_count; i++){
    _message += ", " + string(argument[i]);
}

if (!_condition){
	fuwa_trace("assertion failed: " + _message);
}