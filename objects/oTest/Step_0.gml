fuwa_run();

if (timer_check(testTimer)){
	currentChar = string(timer_get_numfinished(testTimer));
	currentEaseAlgorithm = irandom_range(easetype.linear,(easetype._SIZE - 1));
	timer_set_ease_type(testTimer,currentEaseAlgorithm);
}