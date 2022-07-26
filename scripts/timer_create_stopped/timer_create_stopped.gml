/// @func timer_create_stopped
/// @desc {map} Creates a stopped timer and returns a reference.
/// @arg {real} time
/// @arg {enum*} unit
/// @arg {bool*} autoDestroy 

var _timer = undefined;

// ugh, GML
switch(argument_count){
	case 1:
		_timer = timer_create(argument[0]); break;
	case 2:
		_timer = timer_create(argument[0], argument[1]); break;
	case 3:
		_timer = timer_create(argument[0], argument[1], argument[2]); break;
	default:
		return _FUWA_EXIT_FAILURE;
}

timer_pause(_timer);
return _timer;