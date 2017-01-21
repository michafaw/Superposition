/// scrBuildTeams()

////////////////////
//   Team Alpha   //
////////////////////
var teamAlpha = instance_create(0, 0, objTeamLine);
teamAlpha.x = (room_width - teamAlpha.width)/2;
teamAlpha.y = room_height - teamAlpha.height/2;

// Player 1
var player1 = instance_create(teamAlpha.x, teamAlpha.y, objPlayerLine);
player1.lineFunction = scrSineWave;
player1.lineDrawColor = c_green;
teamAlpha.playerA = player1;
scrSetPlayerLineLength(player1, teamAlpha.width);

// Player 3
if(numPlayers >= 3) {
  var player3 = instance_create(teamAlpha.x, teamAlpha.y, objPlayerLine);
  player3.lineFunction = scrTriangleWave;
  player3.lineDrawColor = c_lime;
  teamAlpha.playerB = player3;
  scrSetPlayerLineLength(player3, teamAlpha.width);
} 


///////////////////
//   Team Beta   //
///////////////////
var teamBeta = instance_create(0, 0, objTeamLine);
teamBeta.x = (room_width - teamBeta.width)/2;
teamBeta.y = teamBeta.height/2;

// Player 2
var player2 = instance_create(teamBeta.x, teamBeta.y, objPlayerLine);
player2.lineFunction = scrSineWave;
player2.lineDrawColor = c_blue;
teamBeta.playerA = player2;
scrSetPlayerLineLength(player2, teamBeta.width);

// Player 4
if(numPlayers >= 4) {
  var player4 = instance_create(teamBeta.x, teamBeta.y, objPlayerLine);
  player4.lineFunction = scrSquareWave;
  player4.lineDrawColor = c_aqua;
  teamBeta.playerB = player4;
  scrSetPlayerLineLength(player4, teamBeta.width);
}
