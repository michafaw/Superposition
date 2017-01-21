/// scrBuildLinePointArray(lineFunction, amplitude, frequency, phase, numPoints)

var lineFunction = argument0;
var amplitude = argument1;
var frequency = argument2;
var phase = argument3;
var numPoints = argument4;

var pointArray;
var currentT;

for(var i = 0; i < numPoints; i += 1) {
  currentT = i/numPoints;
  //show_debug_message("Drawing line from (" + string(prevX) + ", " + string(prevY) + ")" + " to (" + string(currentX) + ", " + string(currentY) + ")");
  //draw_line_width_colour(prevX, prevY, currentX, currentY, lineDrawWidth, lineDrawColor, lineDrawColor);
  pointArray[i] = script_execute(lineFunction, amplitude, frequency, phase, currentT);
}

return pointArray;
