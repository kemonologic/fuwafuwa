fuwa_init();

testTimer = timer_create(3,time_start.s,false);
timer_set_repeat(testTimer,true);
timer_pause(testTimer);

currentLetter = "";
currentEaseAlgorithm = easetype.linear;