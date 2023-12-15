class StandingsModel{
  late String TeamName;
  late String bestTeamLogo;
  late int Goals;
  late int matchesPlay;
  late int points;
  late int position;

  StandingsModel(
      this.Goals,
      this.TeamName,
      this.matchesPlay,
      this.points,
      this.position,
      this.bestTeamLogo,
      );
  StandingsModel.fromJson(Map<String,dynamic>json){
    points=json['points'];
    position=json['position'];
    TeamName=json['team']['shortName'];
    Goals=json['goalsFor'];
    matchesPlay=json['playedGames'];
    bestTeamLogo=json['team']['crest'];

  }

// static ScorersModel fromJson(e) {}
//ScorersModel.fromJson(e) {}
}

/*
"scorers": [
{
"player": {
"id": 38101,
"name": "Erling Haaland",
"firstName": "Erling Braut",
"lastName": null,
"dateOfBirth": "2000-07-21",
"nationality": "Norway",
"position": "Offence",
"shirtNumber": null,
"lastUpdated": "2022-07-26T15:39:30Z"
},
"team": {
"id": 65,
"name": "Manchester City FC",
"shortName": "Man City",
"tla": "MCI",
"crest": "https://crests.football-data.org/65.png",
"address": "SportCity Manchester M11 3FF",
"website": "https://www.mancity.com",
"founded": 1880,
"clubColors": "Sky Blue / White",
"venue": "Etihad Stadium",
"lastUpdated": "2022-02-10T19:48:37Z"
},
"playedMatches": 30,
"goals": 34,
"assists": 7,
"penalties": 7
},*/