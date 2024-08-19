import 'package:hive/hive.dart';
import 'package:premleague/Clean_arch/Core/Utils/Strings/app_text.dart';
import '../../domain/entities/matches_result_entity.dart';

abstract class MatchesResultLocalDataSource {
  Future<List<MatchesResultEntity>> getMatchesResultFromLocalDataSource();
}
class MatchesResultLocalDataSourceImpl extends MatchesResultLocalDataSource{
  @override
  Future<List<MatchesResultEntity>> getMatchesResultFromLocalDataSource() async {
  var box= Hive.box<MatchesResultEntity>(AppText.matchesResultBox);
  print('getting cached data');
     return box.values.toList();
  }
}