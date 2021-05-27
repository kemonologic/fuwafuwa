draw_set_font(fTest);
draw_text(20,20,"Timer length: " + string(timer_get_duration(testTimer)) + timer_get_unit_string(testTimer));
draw_text(20,60,"Times finished: " + string(timer_get_numfinished(testTimer)));
draw_text(600,60,timer_get_ease_type_string(testTimer));

var _easeValue = timer_get_ease(testTimer);
var _windowHeight = window_get_height();
draw_text(_easeValue * window_get_width(), _windowHeight / 2, currentChar);