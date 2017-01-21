///scrSquareWave(amplitude, frequency, phase, time)

var amplitude = argument0;
var frequency = argument1;
var phase = argument2;
var time = argument3;

if((time % 1) < 0.5)
  return amplitude;
  
return -amplitude;
