/// scrSetPlayerLineLength(playerLineInstance, length)

var playerLineInstance = argument0;
var length = argument1;

with(playerLineInstance) {
  lineLength = length;
  xDrawSpacing = lineLength/numPointsInLinePointArray;
}
