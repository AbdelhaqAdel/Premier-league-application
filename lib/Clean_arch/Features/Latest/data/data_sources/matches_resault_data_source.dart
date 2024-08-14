import 'package:dio/dio.dart';
import 'package:premleague/Clean_arch/Core/remote/DioHelper.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/remote/models/MatchesResultsModel.dart';

import '../../../../Core/remote/endPoints.dart';
import '../../domain/entities/matches_resault_entity.dart';

abstract class MatchesResultDataSource {
  Future<List<MatchesResultEntity>> getMatchesResultFromDataSource();
}

class MatchesResultDataSourceImpl extends MatchesResultDataSource{
  List<MatchesResultEntity>matchesResult = [];

  @override
  Future<List<MatchesResultEntity>> getMatchesResultFromDataSource() async {
    await DioHelper2.GetData(
        EndPoint: MATCHESRESULTS).then((value){
      fillMatchesResultList(value);
    });
    return matchesResult;
  }

  void fillMatchesResultList(Response<dynamic> list) {
    List Json = list.data['response'];
    for (var element in Json) {
      matchesResult.add(MatchesResultsModel.fromJson(element));
    }
  }
}