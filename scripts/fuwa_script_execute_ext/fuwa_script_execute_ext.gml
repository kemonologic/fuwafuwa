/// @func fuwa_script_execute_ext
/// @desc "But we have no plans to let you pass in an array and have it mirror across to argument[] - there just isn't the demand for it.
/// @desc In 5 years of Studio, and previously in 8.1, no one has ever asked for it." 
/// @arg {script} scrIndex
/// @arg {any[]} argv

var _scrIndex = argument[0];
var _argv = argument[1];

if (!script_exists(_scrIndex)) {
	return _FUWA_EXIT_FAILURE;
}
if (!is_array(_argv)) {
	return _FUWA_EXIT_FAILURE;
}
switch (array_length_1d(_argv)) {
	case 0:
		script_execute(_scrIndex); break;
	case 1:
		script_execute(_scrIndex, _argv[0]); break;
	case 2:
		script_execute(_scrIndex, _argv[0], _argv[1]); break;
	case 3:
		script_execute(_scrIndex, _argv[0], _argv[1], _argv[2]); break;
	case 4:
		script_execute(_scrIndex, _argv[0], _argv[1], _argv[2], _argv[3]); break;
	case 5:
		script_execute(_scrIndex, _argv[0], _argv[1], _argv[2], _argv[3], _argv[4]); break;
	case 6:
		script_execute(_scrIndex, _argv[0], _argv[1], _argv[2], _argv[3], _argv[4], _argv[5]); break;
	case 7:
		script_execute(_scrIndex, _argv[0], _argv[1], _argv[2], _argv[3], _argv[4], _argv[5], _argv[6]); break;
	case 8:
		script_execute(_scrIndex, _argv[0], _argv[1], _argv[2], _argv[3], _argv[4], _argv[5], _argv[6], _argv[7]); break;
	case 9:
		script_execute(_scrIndex, _argv[0], _argv[1], _argv[2], _argv[3], _argv[4], _argv[5], _argv[6], _argv[7], _argv[8]); break;
	case 10:
		script_execute(_scrIndex, _argv[0], _argv[1], _argv[2], _argv[3], _argv[4], _argv[5], _argv[6], _argv[7], _argv[8], _argv[9]); break;
}
