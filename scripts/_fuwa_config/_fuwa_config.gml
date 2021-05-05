// ****** CONSTANTS ******
#macro _FUWA_VERSION "0.2.8"
#macro _FUWA_EXIT_FAILURE -1

// ****** OPTIONS ******
#macro _FUWA_OPTIONS_FRAMERATE game_get_speed(gamespeed_fps); // Game framerate
#macro _FUWA_OPTIONS_TIMER_CLEAN_INTERVAL 300 // Deactivated timer cleanum interval (in frames) 

// ****** ENUMS ******
enum time{
	frames,
	ms,
}

// Allow different inputs for timer_create that are converted to the above
enum time_start{
	frames,
	ms, // ms (not framelocked, uses current_time)
	s, // s (not framelocked, uses current_time) and converted to ms in the timer
	msframes, // ms but converted to frames in the timer (framelocked)
	sframes // s but converted to frames in the timer (framelocked)
}

enum easetype{
	none,
	linear,
	percent,
	percent_osc,
	easeInQuad,
	easeOutQuad,
	easeInOutQuad,
	easeInCubic,
	easeOutCubic,
	easeInOutCubic,
	easeInQuart,
	easeOutQuart,
	easeInOutQuart,
	easeInQuint,
	easeOutQuint,
	easeInOutQuint,
	easeInSine,
	easeOutSine,
	easeInOutSine,
	easeInCirc,
	easeOutCirc,
	easeInOutCirc,
	easeInExpo,
	easeOutExpo,
	easeInOutExpo,
	easeInElastic,
	easeOutElastic,
	easeInOutElastic,
	easeInBack,
	easeOutBack,
	easeInOutBack,
	easeInBounce,
	easeOutBounce,
	easeInOutBounce,
	_SIZE
}