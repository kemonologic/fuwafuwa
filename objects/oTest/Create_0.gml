fuwa_init();

testTimer = timer_create([3,2],time.s,false);
timer_set_repeat(testTimer,true);
timer_set_pingpong(testTimer,pingpongtype.invertOnOdd);

currentChar = string(timer_get_numfinished(testTimer));
currentEaseAlgorithm = easetype.linear;