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
    //  ss.getAllScorers();
    var featchedData = await DioHelper.GetData(
      EndPoint: STANDINGS,
    );
    // .then((value) {
      // if(value.statusCode==200){
        // var Json= json.decode(jsonEncode(value.data));
        getStandingList(featchedData);
        return standings;
      // }}).catchError((onError){
      // print(onError.toString());
    // });
  }
  void getStandingList(Response<dynamic> featchedData) {
      List Json = featchedData.data['standings'][0]['table'];
    for (var element in Json) {
      standings.add(StandingsModel.fromJson(element));
    }
  }
}