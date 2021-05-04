draw_set_font(fTest);
draw_text(20,20,"Timer length: " + string(timer_get_duration(testTimer)));
draw_text(20,60,"Times finished: " + string(timer_get_numfinished(testTimer)));