class MatchTimeModel {
  late String homeName;
  late String homeLogo;
  late String awayName;
  late String awayLogo;
  late String date;

  MatchTimeModel(
      this.homeName,
      this.homeLogo,
      this.awayName,
      this.awayLogo,
      this.date,
  );

  MatchTimeModel.fromJson(Map<String, dynamic>json){
    homeName = json['teams']['home']['name'];
    homeLogo = json['teams']['home']['logo'];
    awayName = json['teams']['away']['name'];
    awayLogo = json['teams']['away']['logo'];
    date = json['fixture']['date'];

  }
}