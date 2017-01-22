/// scrHandleBallLineCollision(ballInstance, teamInstance)

var ballInstance = argument0;
var teamInstance = argument1;

//show_debug_message("Collision with team with position " + string(teamInstance.position));
/*
// Temporary reflect code when hitting the bounding box
if(teamInstance.position == -1) {
  ballInstance.vspeed = abs(ballInstance.vspeed);
} else {
  ballInstance.vspeed = -1*abs(ballInstance.vspeed);
}
*/
// Adjust these to section off the point checks to within certain x ranges
var startPoint = 0;
var endPoint = SAMPLE_POINTS-1;

with(teamInstance) {
  var xDrawSpacing = width/SAMPLE_POINTS;
  var minimumI = 10000;
  var maximumI = -10000;
  
  var minCollisionX = 10000;
  var minCollisionY = 10000;
  var maxCollisionX = -10000;
  var maxCollisionY = -10000;

  var collided = false;
  
  for(var i = startPoint; i <= endPoint; i++) {
    sampleX = x + i*xDrawSpacing;
    sampleY = y + linePointArray[i];
    var collidedBall = collision_point(sampleX, sampleY, objBall, true, false);
    if(collidedBall == ballInstance) {
      collided = true;
      if(i < minimumI) {
        minimumI = i;
        minCollisionX = sampleX;
        minCollisionY = sampleY;
      }
      if(i > maximumI) {
        maximumI = i;
        maxCollisionX = sampleX;
        maxCollisionY = sampleY;
      }
    }
  }
  if(collided) {
    audio_play_sound(sndLineBounce, 0, false);
    //show_debug_message("Ball collided with line at " + string(minCollisionX) + ", " + string(minCollisionY));
    
    // Adjust for single hits on the ends
    
    if(minimumI == maximumI) {
      // Adjust for single hits on the ends
      if(minimumI == startPoint) {
        maximumI++;
        maxCollisionX = x + maximumI*xDrawSpacing;
        maxCollisionY = y + linePointArray[maximumI];
      } else if(maximumI == endPoint) {
        minimumI--;
        minCollisionX = x + minimumI*xDrawSpacing;
        minCollisionY = y + linePointArray[minimumI];
      }
      // If there's still only one point, go out to the two neighbor points
      if(minimumI == maximumI) {
        minimumI--;
        minCollisionX = x + minimumI*xDrawSpacing;
        minCollisionY = y + linePointArray[minimumI];
        maximumI++;
        maxCollisionX = x + maximumI*xDrawSpacing;
        maxCollisionY = y + linePointArray[maximumI];
      }
    }
    
    // Calculate the normal of the two points, facing towards the middle
    var normalAngle;
    if(position == 1) {
      //normalAngle = point_direction(0, 0, (maxCollisionY - minCollisionY), -1*(maxCollisionY - minCollisionY));
      normalAngle = scrNormalAngle(maxCollisionX, maxCollisionY, minCollisionX, minCollisionY);
    } else {
      //normalAngle = point_direction(0, 0, -1*(maxCollisionY - minCollisionY), (maxCollisionY - minCollisionY));
      normalAngle = scrNormalAngle(minCollisionX, minCollisionY, maxCollisionX, maxCollisionY);
    }
    
    // Push ball out one unit of normal vector
    var centerI = floor(lerp(minimumI, maximumI, 0.5));
    var centerX = x + centerI*xDrawSpacing;
    var centerY = y + linePointArray[centerI];
    var penDistance = ballInstance.radius - point_distance(ballInstance.x, ballInstance.y, centerX, centerY);
    ballInstance.x += lengthdir_x(penDistance, normalAngle);
    ballInstance.y += lengthdir_y(penDistance, normalAngle);
    //show_debug_message("            Pushed back to " + string(ballInstance.x) + ", " + string(ballInstance.y));
    //show_debug_message("PenDepth: " + string(penDistance) + " - Pushed back to " + string(ballInstance.x) + ", " + string(ballInstance.y));
    
    ballInstance.direction = scrReflectionAngle(ballInstance.direction, normalAngle);
    
    /*
    // Placeholder reflect code
    if(position == 1) {
      ballInstance.vspeed = 1*abs(ballInstance.vspeed);
    } else {
      ballInstance.vspeed = -1*abs(ballInstance.vspeed);
    }
    */
  }
}

