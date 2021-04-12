/// @func fuwa_run
/// @desc {void} To be run by timer controller (step)

global.fuwa_clockTime = current_time;
global.fuwa_clockFrames++;
global.fuwa_lastClearedTimerFrames++;

// Periodically clear out deactivated timers
if (global.fuwa_lastClearedTimerFrames >= _FUWA_OPTIONS_TIMER_CLEAN_INTERVAL){
	fuwa_clean_deactivated();
	global.fuwa_lastClearedTimerFrames = 0;
}

for (var i = 0; i < ds_list_size(global._fuwa_timerTree); i++){
	var _timer = global._fuwa_timerTree[| i];
	
	var _timerPaused = timer_get_paused(_timer);
	if (_timerPaused){
		continue;
	}
	
	var _isFrameLocked = timer_get_framelocked(_timer);
	var _clock = _isFrameLocked ? fuwa_get_clockframes() : fuwa_get_clocktime();
	
	// Check alarm start to update if it's active
	var _timerStart = timer_get_start(_timer);
	var _timerActive = timer_get_active(_timer);
	
	var _timerEasetype = timer_get_ease_type(_timer);

	if (!_timerActive && _timerStart <= _clock){
		_timer[? "ACTIVE"] = true;
	}
	
	_timer[? "WAS_RESET"] = false;
	
	// Update time_current
	if (_timerActive){
		_timer[? "TIME_CURRENT"] = _clock;
	}
	
	var _normalizedValue = fuwa_normalize(_timer[? "TIME_CURRENT"], _timer[? "TIME_START"], 
													 _timer[? "TIME_END"]);
																		
	// Update ease value
	if (timer_get_ease_interval(_timer) == 0 || (_timer[? "TIME_CURRENT"] > _timer[? "TIME_EASE_INTERVAL_NEXT"])){	
		if (timer_get_ease_interval(_timer) > 0){
			fuwa_timer_update_ease_interval_next(_timer);
		}
		switch (_timerEasetype){
			case easetype.none: 
				break;
			case easetype.linear:
				_timer[? "EASE_CURRENT"] = _normalizedValue; break;
			case easetype.percent: 
				_timer[? "EASE_CURRENT"] = clamp(
														fuwa_perc( _timer[? "TIME_CURRENT"], 
																_timer[? "TIME_START"], 
																_timer[? "TIME_END"]),
														0, 100); break;
				break;
			case easetype.easeInQuad:
				_timer[? "EASE_CURRENT"] = EaseInQuad(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutQuad:
				_timer[? "EASE_CURRENT"] = EaseOutQuad(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutQuad:
				_timer[? "EASE_CURRENT"] = EaseInOutQuad(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInCubic:
				_timer[? "EASE_CURRENT"] = EaseInCubic(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutCubic:
				_timer[? "EASE_CURRENT"] = EaseOutCubic(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutCubic:
				_timer[? "EASE_CURRENT"] = EaseInOutCubic(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInQuart:
				_timer[? "EASE_CURRENT"] = EaseInQuart(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutQuart:
				_timer[? "EASE_CURRENT"] = EaseOutQuart(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutQuart:
				_timer[? "EASE_CURRENT"] = EaseInOutQuart(_normalizedValue, 0, 1, 1);
				break; 
			case easetype.easeInQuint:
				_timer[? "EASE_CURRENT"] = EaseInQuint(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutQuint:
				_timer[? "EASE_CURRENT"] = EaseOutQuint(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutQuint:
				_timer[? "EASE_CURRENT"] = EaseInOutQuint(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInSine:
				_timer[? "EASE_CURRENT"] = EaseInSine(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutSine:
				_timer[? "EASE_CURRENT"] = EaseOutSine(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutSine:
				_timer[? "EASE_CURRENT"] = EaseInOutSine(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInCirc:
				_timer[? "EASE_CURRENT"] = EaseInCirc(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutCirc:
				_timer[? "EASE_CURRENT"] = EaseOutCirc(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutCirc:
				_timer[? "EASE_CURRENT"] = EaseInOutCirc(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInExpo:
				_timer[? "EASE_CURRENT"] = EaseInExpo(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutExpo:
				_timer[? "EASE_CURRENT"] = EaseOutExpo(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutExpo:
				_timer[? "EASE_CURRENT"] = EaseInOutExpo(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInElastic:
				_timer[? "EASE_CURRENT"] = EaseInElastic(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutElastic:
				_timer[? "EASE_CURRENT"] = EaseOutElastic(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutElastic:
				_timer[? "EASE_CURRENT"] = EaseInOutElastic(_normalizedValue, 0, 1, 1);
				break; 
			case easetype.easeInBack:
				_timer[? "EASE_CURRENT"] = EaseInBack(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutBack:
				_timer[? "EASE_CURRENT"] = EaseOutBack(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutBack:
				_timer[? "EASE_CURRENT"] = EaseInOutBack(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInBounce:
				_timer[? "EASE_CURRENT"] = EaseInBounce(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeOutBounce:
				_timer[? "EASE_CURRENT"] = EaseOutBounce(_normalizedValue, 0, 1, 1);
				break;
			case easetype.easeInOutBounce:
				_timer[? "EASE_CURRENT"] = EaseInOutBounce(_normalizedValue, 0, 1, 1);
				break;
		}
	}
	// If finished, wrap up
	if (timer_check(_timer,true)){
		// Update "finished" count
		_timer[? "TIMES_FINISHED"] += 1;
		
		// Run script
		if (!is_undefined(_timer[? "SCRIPT"]) && instance_exists(_timer[? "SCRIPT_SCOPE"])){
			with (_timer[? "SCRIPT_SCOPE"]){
				script_execute(_timer[? "SCRIPT"]);
			}
		}
		
		// Reset timer to start time if repeats
		if (timer_get_repeat(_timer)){
			timer_restart(_timer);
		}
	}
}
