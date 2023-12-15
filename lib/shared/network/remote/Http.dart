// import 'dart:convert';
//
// import 'package:http/http.dart';
// import 'package:premleague/shared/network/endPoints.dart';
//
// import '../../../model/scorerModel2.dart';
//
//
// class ScorersApi {
//   var apiUrl = "https://api.football-data.org/${SCORERS}";
//
//   static const headers = {
//     'X-Auth-Token': 'd781a50e6c8b4fe1a2e199099e43e365',
//   };
//
//   Future<List<ScorersModel2>> getAllScorers() async{
//     List<ScorersModel2> matches = [];
//
//     Response res = await get(apiUrl,headers: headers);
//    //  body;
//     if(res.statusCode == 200) {
//       var body = jsonDecode(res.body);
//       List<dynamic> matchesList = body['response'];
//       print("Api service: ${body}");
//       matches = matchesList.map((dynamic item) => ScorersModel2.fromJson(item)).toList();
//     }
//     return matches;
//   }
// }