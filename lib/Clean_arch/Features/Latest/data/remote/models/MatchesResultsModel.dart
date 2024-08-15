//to make a relationshio betwean matches resault entity and model i will extend the entity here
//then i will use the data that showing in UI
import 'package:premleague/Clean_arch/Features/Latest/domain/entities/matches_result_entity.dart';

class MatchesResultsModel extends MatchesResultEntity{
  final String? homeName;
  final String? homeLogo;
  final String? awayName;
  final String? awayLogo;
  final num? scoreHome;
  final num? scoreAway;
  final String? state;

  MatchesResultsModel({
      this.homeName,
      this.homeLogo,
      this.awayName,
      this.awayLogo,
      this.scoreHome,
      this.scoreAway,
      this.state,
}) : super(homeName, homeLogo??'', awayName, awayLogo??'', scoreHome, scoreAway);

   factory MatchesResultsModel.fromJson(Map<String, dynamic>json){
     return MatchesResultsModel(
    homeName : json['teams']['home']['name'],
    homeLogo : json['teams']['home']['logo']??'',
    awayName : json['teams']['away']['name'],
    awayLogo : json['teams']['away']['logo']??'',
    scoreHome : json['goals']['home'],
    scoreAway : json['goals']['away'],
    state : json['fixture']['status']['short']
    );
  }
}