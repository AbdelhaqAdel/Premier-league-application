//all data that used in UI

class MatchesResultEntity{
  final String? homeNameE;
  final String? homeLogoE;
  final String? awayNameE;
  final String? awayLogoE;
  final num? scoreHomeE;
  final num? scoreAwayE;
  
    MatchesResultEntity(
      this.homeNameE,
      this.homeLogoE,
      this.awayNameE,
      this.awayLogoE,
      this.scoreHomeE,
      this.scoreAwayE,
      );
 //factory MatchesResultEntity.fromJson(Map<String, dynamic>json);
}