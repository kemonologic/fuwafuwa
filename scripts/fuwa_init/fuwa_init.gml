/// @func fuwa_init
/// @desc {void} Setup for fuwafuwa controller (for create event)

global._fuwa_instanceMap = ds_map_create();
global._fuwa_instanceList = ds_list_create();

//global._fuwa_timerTree = ds_list_create();
//global._fuwa_deactivatedTimerTree = ds_list_create();

global.fuwa_clockTime = current_time;
global.fuwa_clockFrames = 0;

global.fuwa_lastClearedTimerFrames = 0;