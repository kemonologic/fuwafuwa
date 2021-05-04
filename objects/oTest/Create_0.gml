fuwa_init();

testTimer = timer_create(1,time_start.s,false);
timer_set_repeat(testTimer,true);
timer_pause(testTimer);