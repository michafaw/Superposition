/// scrCreateBall()

var serveDown = choose(true, false);

if(serveDown) {
  newDirection = irandom_range(205, 335);
  newY = room_height/2 + -100;
} else {
  newDirection = irandom_range(25, 155);
  newY = room_height/2 + 100;
}

var ball = instance_create(room_width/2 + irandom_range(-100, 100), newY, objBall);
ball.direction = newDirection;
