import 'package:dio/dio.dart';
import 'package:premleague/Clean_arch/Core/Utils/Strings/app_text.dart';
import 'package:premleague/Clean_arch/Core/remote/DioHelper.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/remote/models/MatchesResultsModel.dart';
import '../../../../Core/Utils/save_date_to_hive.dart';
import '../../../../Core/remote/endPoints.dart';
import '../../domain/entities/matches_result_entity.dart';

abstract class MatchesResultRemoteDataSource {
  Future<List<MatchesResultEntity>> getMatchesResultFromDataSource();
}

class MatchesResultRemoteDataSourceImpl extends MatchesResultRemoteDataSource{
  List<MatchesResultEntity>matchesResult = [];

  @override
  Future<List<MatchesResultEntity>> getMatchesResultFromDataSource() async {
    await DioHelper2.GetData(
        EndPoint: MATCHESRESULTS).then((value){
      fillMatchesResultList(value);
    });

    SaveToHive.saveDataToHive<MatchesResultEntity>(matchesResult,AppText.matchesResultBox);
    return matchesResult;
  }

  void fillMatchesResultList(Response<dynamic> list) {
    List Json = list.data['response'];
    for (var element in Json) {
      matchesResult.add(MatchesResultsModel.fromJson(element));
    }
  }


}