//all data that used in UI
import 'package:hive/hive.dart';
part 'matches_result_entity.g.dart';

@HiveType(typeId: 1)
class MatchesResultEntity{
  @HiveField(0)
  final String? homeNameE;
  @HiveField(1)
  final String? homeLogoE;
  @HiveField(2)
  final String? awayNameE;
  @HiveField(3)
  final String? awayLogoE;
  @HiveField(4)
  final num? scoreHomeE;
  @HiveField(5)
  final num? scoreAwayE;
  @HiveField(6)
  final String? stateE;

  MatchesResultEntity(
      this.homeNameE,
      this.homeLogoE,
      this.awayNameE,
      this.awayLogoE,
      this.scoreHomeE,
      this.scoreAwayE,
      this.stateE,
      );
}