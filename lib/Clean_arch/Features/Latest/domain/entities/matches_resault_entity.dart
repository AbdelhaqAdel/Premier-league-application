//all data that used in UI

class MatchesResaultEntity{
  late String? homeNameE;
  late String? homeLogoE;
  late String? awayNameE;
  late String? awayLogoE;
  late num? scoreHomeE;
  late num? scoreAwayE;
  
    MatchesResaultEntity(
      this.homeNameE,
      this.homeLogoE,
      this.awayNameE,
      this.awayLogoE,
      this.scoreHomeE,
      this.scoreAwayE,
      );
   MatchesResaultEntity.fromJson(Map<String, dynamic>json);
}