/// scrDrawLineFromPoints(linePointArray, xDrawSpacing, lineDrawWidth)

var linePointArray = argument0;
var xDrawSpacing = argument1;
var lineDrawWidth = argument2;

var prevX = x;
var prevY = y + linePointArray[0];
var currentX;
var currentY;
for(var i = 1; i < SAMPLE_POINTS; i++) {
  currentX = x + i*xDrawSpacing;
  currentY = y + linePointArray[i];
  //show_debug_message("Drawing line from (" + string(prevX) + ", " + string(prevY) + ")" + " to (" + string(currentX) + ", " + string(currentY) + ")");
  
  if(abs(currentY - prevY) > lineDrawWidth/2) {
    draw_line_width_colour(prevX, prevY, currentX, currentY, lineDrawWidth, lineDrawColor, lineDrawColor);
  }
  
  draw_circle_colour(currentX, currentY, lineDrawWidth/2, lineDrawColor, lineDrawColor, false);
  prevX = currentX;
  prevY = currentY;
}
