import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:premleague/Clean_arch/Core/remote/DioHelper.dart';
import 'package:premleague/Clean_arch/Core/remote/endPoints.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';

abstract class StandingTableDataSource{
  Future<List<StandingsModel>> getStandingData();
}


//-------------Single resposibility--------------------------------
class StandingTableDataSourceImpl extends StandingTableDataSource{
  List<StandingsModel>standings=[];
  @override 
  Future<List<StandingsModel>> getStandingData() async{
    print('getting data from data source');
    //  ss.getAllScorers();
    await DioHelper.GetData(
      EndPoint: STANDINGS,
    ).then((value) {
        getStandingList(value);
     // print('alllllll DATA ${value.data}');
      });

    // .then((value) {
      // if(value.statusCode==200){
        // var Json= json.decode(jsonEncode(value.data));
     //   print('|||||||||||||||||||')
  
            // standings.forEach((element) {
            //   print(element.teamName);
            //   print(element.goals);
            //   print(element.matchesPlay);
            //   print(element.points);
            //   print(element.position);
        

            // });
          return standings;
      // }}).catchError((onError){
      // print(onError.toString());
    // });
  }
  void getStandingList(Response<dynamic> featchedData) {
      List Json = featchedData.data['standings'][0]['table'];
    for (var element in Json) {
     // print(json);
      standings.add(StandingsModel.fromJson(element));
    }
  }
}