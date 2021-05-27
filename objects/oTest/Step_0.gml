fuwa_run();

if (timer_check(testTimer)){
	currentChar = string(timer_get_numfinished(testTimer));
	do { // percent is conenient soemtimes but doesn't function as a normal ease type obviously
	   currentEaseAlgorithm = irandom_range(easetype.linear,(easetype._SIZE - 1));
	} until (currentEaseAlgorithm != easetype.percent);
	timer_set_ease_type(testTimer,currentEaseAlgorithm);
}