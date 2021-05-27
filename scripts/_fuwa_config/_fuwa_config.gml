// ****** CONSTANTS ******
#macro _FUWA_VERSION "0.3.0"
#macro _FUWA_EXIT_FAILURE -1

// ****** OPTIONS ******
#macro _FUWA_OPTIONS_FRAMERATE game_get_speed(gamespeed_fps) // Game framerate
#macro _FUWA_OPTIONS_TIMER_CLEAN_INTERVAL 300 // Deactivated timer cleanum interval (in frames) 
#macro _FUWA_OPTIONS_USE_BASE_UNITS false // If enabled, all changes will be made in terms of
                                           // frames or ms rather than the timer's unit
										   // e.g. a timer set for 5 seconds will return 5000 duration
// ****** ENUMS ******
enum time{
	frames,
	ms, // ms (not framelocked, uses current_time)
	s, // s (not framelocked, uses current_time) and converted to ms in the timer
	msframes, // ms but converted to frames in the timer (framelocked)
	sframes // s but converted to frames in the timer (framelocked)
}

enum pingpongtype{
	none,
	invertOnEven, // start inverted, normal, then invert again
	invertOnOdd // start normal, invert, then normal again
}

enum easetype{
	none,
	linear,
	percent,
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