// ****** CONSTANTS ******
#macro _FUWA_VERSION "1.1.1"
#macro _FUWA_EXIT_FAILURE -1

// ****** OPTIONS ******
// https://github.com/kemonologic/fuwafuwa/wiki/_fuwa_config
#macro _FUWA_OPTIONS_FRAMERATE game_get_speed(gamespeed_fps) // Game framerate
#macro _FUWA_OPTIONS_TIMER_CLEAN_INTERVAL 300 // Autodestroy timer cleanup interval (in frames) 
#macro _FUWA_OPTIONS_DISABLE_AUTODESTROY false // If enabled, turns off periodic garbage collection
											   // and forces autoDestroy to false on all timers
#macro _FUWA_OPTIONS_USE_BASE_UNITS false // If enabled, all changes will be made in terms of
                                           // frames or ms rather than the timer's unit
										   // e.g. a timer set for 5 seconds will return 5000 duration



// ****** ENUMS ******
enum time{ // use high values so we can differentiate from boolean in timer_create
	frames = 1000,
	ms = 1001, // ms (not framelocked, uses current_time)
	s = 1002, // s (not framelocked, uses current_time) and converted to ms in the timer
	msframes = 1003, // ms but converted to frames in the timer (framelocked)
	sframes = 1004 // s but converted to frames in the timer (framelocked)
}

enum pingpongtype{
	none,
	invertOnEven, // start inverted, normal, then invert again
	invertOnOdd // start normal, invert, then normal again
}

enum fuwasequence{
	duration,
	completed,
	_SIZE
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