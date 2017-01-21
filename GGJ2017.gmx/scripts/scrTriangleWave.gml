///scrTriangleWave(amplitude, frequency, phase, time)

var amplitude = argument0;
var frequency = argument1;
var phase = argument2;
var time = argument3;


//return amplitude*(((((time+phase/(2*pi*frequency))*frequency) % 1) + 1) % 1);

//return amplitude*(((time+phase/(2*pi*frequency))*frequency) % 1);

var a = amplitude;
var p = 1.0/frequency;
var adjustedPhase = phase;
while(adjustedPhase < 0)
  adjustedPhase = adjustedPhase + 2*pi;
var t = time + adjustedPhase/(2*pi*frequency);


return 2*(2*a)/p*(abs((t % p) - p/2) - p/4);
