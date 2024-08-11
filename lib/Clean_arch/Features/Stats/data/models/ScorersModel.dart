class ScorersModel{
  late String PlayerName;
  late int PlayerId;
  late int teamId;
  late String TeamName;
  late int Goals;
  late int matchesPlay;
  ScorersModel(
   this.PlayerName,
     this.PlayerId,
     this.teamId,
   this.Goals,
   this.TeamName,
   this.matchesPlay,
  );
  ScorersModel.fromJson(Map<String,dynamic>json){
    PlayerName=json['player']['name'].toString();
    PlayerId=json['player']['id'];
    teamId=json['team']['id'];
    TeamName=json['team']['shortName'];
    Goals=json['goals'];
    matchesPlay=json['playedMatches'];

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