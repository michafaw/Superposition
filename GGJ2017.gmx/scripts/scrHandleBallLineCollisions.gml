/// scrHandleBallLineCollision()


// Check top team's collision box
with(objTeamLine) {
  var collidingBall;
  if(position == 1) {
    // Top team
    collidingBall = collision_rectangle(x, y-height/2-boundingBoxYMargin, x+width, y+height/2+boundingBoxYMargin, objBall, false, false); 
    
  } else {
    // Bottom team
    
    
  }
  if(collidingBall == noone) {
    return 0;
  }
    
}
