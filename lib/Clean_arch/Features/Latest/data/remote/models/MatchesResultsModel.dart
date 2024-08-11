class MatchesResultsModel {
  late String homeName;
  late String homeLogo;
  late String awayName;
  late String awayLogo;
  late int scoreHome;
  late int scoreAway;
  late String state;


  MatchesResultsModel(
      this.homeName,
      this.homeLogo,
      this.awayName,
      this.awayLogo,
      this.scoreHome,
      this.scoreAway,
      this.state,
      );

  MatchesResultsModel.fromJson(Map<String, dynamic>json){
    homeName = json['teams']['home']['name'];
    homeLogo = json['teams']['home']['logo'];
    awayName = json['teams']['away']['name'];
    awayLogo = json['teams']['away']['logo'];
    scoreHome = json['goals']['home'];
    scoreAway = json['goals']['away'];
    state = json['fixture']['status']['short'];
  }
}