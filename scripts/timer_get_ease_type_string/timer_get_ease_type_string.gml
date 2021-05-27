/// @func timer_get_ease_type_string
/// @desc {void} Get ease type as a string.
/// @arg {map} timer

var _timer = argument[0];
var _easeType = timer_get_ease_type(_timer);

switch(_easeType){
	case easetype.none: 
		return "None"; 
		break;
	case easetype.linear:
		return "Linear";
		break;
	case easetype.percent: 
		return "Percent";
		break;
	case easetype.easeInQuad:
		return "easeInQuad";
		break;
	case easetype.easeOutQuad:
		return "easeOutQuad";
		break;
	case easetype.easeInOutQuad:
		return "easeInOutQuad";
		break;
	case easetype.easeInCubic:
		return "easeInCubic";
		break;
	case easetype.easeOutCubic:
		return "easeOutCubic";
		break;
	case easetype.easeInOutCubic:
		return "easeInOutCubic";
		break;
	case easetype.easeInQuart:
		return "easeInQuart";
		break;
	case easetype.easeOutQuart:
		return "easeOutQuart";
		break;
	case easetype.easeInOutQuart:
		return "easeInOutQuart";
		break;
	case easetype.easeInQuint:
		return "easeInQuint";
		break;
	case easetype.easeOutQuint:
		return "easeOutQuint";
		break;
	case easetype.easeInOutQuint:
		return "easeInOutQuint";
		break;
	case easetype.easeInSine:
		return "easeInSine";
		break;
	case easetype.easeOutSine:
		return "easeOutSine";
		break;
	case easetype.easeInOutSine:
		return "easeInOutSine";
		break;
	case easetype.easeInCirc:
		return "easeInCirc";
		break;
	case easetype.easeOutCirc:
		return "easeOutCirc";
		break;
	case easetype.easeInOutCirc:
		return "easeInOutCirc";
		break;
	case easetype.easeInExpo:
		return "easeInExpo";
		break;
	case easetype.easeOutExpo:
		return "easeOutExpo";
		break;
	case easetype.easeInOutExpo:
		return "easeInOutExpo";
		break;
	case easetype.easeInElastic:
		return "easeInElastic";
		break;
	case easetype.easeOutElastic:
		return "easeOutElastic";
		break;
	case easetype.easeInOutElastic:
		return "easeInOutElastic";
		break;
	case easetype.easeInBack:
		return "easeInBack";
		break;
	case easetype.easeOutBack:
		return "easeOutBack";
		break;
	case easetype.easeInOutBack:
		return "easeInOutBack";
		break;
	case easetype.easeInBounce:
		return "easeInBounce";
		break;
	case easetype.easeOutBounce:
		return "easeOutBounce";
		break;
	case easetype.easeInOutBounce:
		return "easeInOutBounce";
		break;
}