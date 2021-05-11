fuwa_init();

testTimer = timer_create(3,time_start.s,false);
timer_set_repeat(testTimer,true);

currentChar = string(timer_get_numfinished(testTimer));
currentEaseAlgorithm = easetype.linear;