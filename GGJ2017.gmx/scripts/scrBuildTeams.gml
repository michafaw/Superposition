/// scrBuildTeams()

////////////////////
//   Team Alpha   //
////////////////////
var teamAlpha = instance_create(0, 0, objTeamLine);
teamAlpha.x = (room_width - teamAlpha.width)/2;
teamAlpha.y = room_height - teamAlpha.height/2;
teamAlpha.position = -1; // bottom
teamAlpha.lineDrawColor = c_lime;
var goalLineAlpha = instance_create(teamAlpha.x, teamAlpha.y + -GOAL_LINE_STARTING_OFFSET, objGoalLine);
goalLineAlpha.position = teamAlpha.position;

// Player 1
var player1 = instance_create(teamAlpha.x, teamAlpha.y, objPlayerLine);
if(RANDOM_WAVEFORM) {
  player1.lineFunction = scrRandomWaveform();
} else {
  player1.lineFunction = scrSineWave;
}
player1.lineDrawColor = c_green;
player1.phase = random_range(-2*pi, 2*pi);
teamAlpha.playerA = player1;
scrSetPlayerLineLength(player1, teamAlpha.width);
scrSetPlayerControls(player1, ord('Z'), ord('X'), ord('D'), ord('C'));
teamAlpha.lineDrawColor = player1.lineDrawColor

// Player 3
if(global.numPlayers >= 3) {
  var player3 = instance_create(teamAlpha.x, teamAlpha.y, objPlayerLine);
  if(RANDOM_WAVEFORM) {
    player3.lineFunction = scrRandomWaveform();
  } else {
    player3.lineFunction = scrTriangleWave;
  }
  player3.lineDrawColor = c_lime;
  player3.phase = random_range(-2*pi, 2*pi);
  teamAlpha.playerB = player3;
  scrSetPlayerLineLength(player3, teamAlpha.width);
  scrSetPlayerControls(player3, ord('Q'), ord('A'), ord('2'), ord('1'));
  teamAlpha.lineDrawColor = merge_colour(player1.lineDrawColor, player3.lineDrawColor, 0.5);
}


///////////////////
//   Team Beta   //
///////////////////
var teamBeta = instance_create(0, 0, objTeamLine);
teamBeta.x = (room_width - teamBeta.width)/2;
teamBeta.y = teamBeta.height/2;
teamBeta.position = 1; // top
teamBeta.lineDrawColor = c_blue;
var goalLineBeta = instance_create(teamBeta.x, teamBeta.y + GOAL_LINE_STARTING_OFFSET, objGoalLine);
goalLineBeta.position = teamBeta.position;

// Player 2
var player2 = instance_create(teamBeta.x, teamBeta.y, objPlayerLine);
if(RANDOM_WAVEFORM) {
  player2.lineFunction = scrRandomWaveform();
} else {
  player2.lineFunction = scrSquareWave;//scrSineWave;
}

player2.lineDrawColor = c_blue;
player2.phase = random_range(-2*pi, 2*pi);
teamBeta.playerA = player2;
scrSetPlayerLineLength(player2, teamBeta.width);
scrSetPlayerControls(player2, ord('N'), ord('M'), ord('H'), ord('B'));
teamBeta.lineDrawColor = player2.lineDrawColor;

// Player 4
if(global.numPlayers >= 4) {
  var player4 = instance_create(teamBeta.x, teamBeta.y, objPlayerLine);
  if(RANDOM_WAVEFORM) {
    player4.lineFunction = scrRandomWaveform();
  } else {
    player4.lineFunction = scrTriangleWave;
  }
  player4.lineDrawColor = c_aqua;
  player4.phase = random_range(-2*pi, 2*pi);
  teamBeta.playerB = player4;
  scrSetPlayerLineLength(player4, teamBeta.width);
  scrSetPlayerControls(player4, ord('L'), ord('P'), 48, 189); // 0 and -
  teamBeta.lineDrawColor = merge_colour(player2.lineDrawColor, player4.lineDrawColor, 0.5);
}
