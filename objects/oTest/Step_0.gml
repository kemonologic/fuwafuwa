fuwa_run();

timer_unpause(testTimer);

if (timer_check(testTimer)){
	currentLetter = chr(irandom_range(ord("A"),ord("Z")));
	currentEaseAlgorithm = irandom_range(easetype.linear,(easetype._SIZE - 1));
	timer_set_ease_type(testTimer,currentEaseAlgorithm);
}