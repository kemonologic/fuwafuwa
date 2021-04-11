/// @description EaseInOutExpo(inputvalue,outputmin,outputmax,inputmax)
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

argument0 /= argument3 * 0.5;

if (argument0 < 1) 
{
    return argument2 * 0.5 * power(2, 10 * --argument0) + argument1;
}

return argument2 * 0.5 * (-power(2, -10 * --argument0) + 2) + argument1;

