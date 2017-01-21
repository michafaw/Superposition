///scrSquareWave(amplitude, frequency, phase, time)

var amplitude = argument0;
var frequency = argument1;
var phase = argument2;
var time = argument3;

// leverage the sine wave function to get the values
//return amplitude*sign(scrSineWave(amplitude, frequency, phase, time));


if( (((((time+phase/(2*pi*frequency))*frequency) % 1) + 1) % 1) < 0.5 )
  return amplitude;
  
return -amplitude;
