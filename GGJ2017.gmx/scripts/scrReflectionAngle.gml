/// scrReflectionAngle(inAngle, normalAngle)

var inAngle = argument0;
var normalAngle = argument1;

var inVX = lengthdir_x(1, inAngle);
var inVY = lengthdir_y(1, inAngle);
var normalVX = lengthdir_x(1, normalAngle);
var normalVY = lengthdir_y(1, normalAngle);

show_debug_message(
  "Bounce - Ball: [" + string(inVX) + ", " + string(inVY) + "] " + 
  "Normal: [" + string(normalVX) + ", " + string(normalVY) + "]");
var innerProduct = 2*dot_product(inVX, inVY, normalVX, normalVY);
var vx = -1*(innerProduct*normalVX - inVX);
var vy = -1*(innerProduct*normalVY - inVY);

var newDirection = point_direction(0, 0, vx, vy);
show_debug_message("inAngle: " + string(inAngle) + ", outAngle: " + string(newDirection));
return newDirection;

