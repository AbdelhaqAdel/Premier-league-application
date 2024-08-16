import 'package:dio/dio.dart';

class DioHelper{
 static Dio dio = Dio(
   BaseOptions(
     baseUrl: 'https://api.football-data.org/',
     receiveDataWhenStatusError: true,
     headers: {
       'X-Auth-Token': 'd781a50e6c8b4fe1a2e199099e43e365',
     },
   ),

 ) ;
  static init(){ //initialization for dio object

  }

 static Future<Response> GetData({
    required String EndPoint,
    //Map <String,dynamic>? query,
  // String? token,
 })async{
   // dio.options.headers={
   //   'Content-Type':'application/json',
   //   'authorization':token??'',
   // };
    return await dio.get(
      EndPoint,
     // queryParameters: query??null,
    );
  }

 /*static Future<Response> PostData({
   required var url,
   Map <String,dynamic>? query,
   required Map <String,dynamic> data,
   String? token,
 })async
 {
   dio.options.headers={
     'Content-Type':'application/json',
     'authorizatio':token,
   };
   return dio.post(
     url,
     queryParameters: query??null,
     data: data,
   );
 }*/
}

class DioHelper2{
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://v3.football.api-sports.io/',
      receiveDataWhenStatusError: true,
      headers: {
        'x-rapidapi-key': '922039861dfb73027aa22aca9c985fef',
      },
    ),

  ) ;
  static init(){ //initialization for dio object.
  }

  static Future<Response> GetData({
    required String EndPoint,
  })async{
    return await dio.get(
      EndPoint ,
    );
  }

/*static Future<Response> PostData({
   required var url,
   Map <String,dynamic>? query,
   required Map <String,dynamic> data,
   String? token,
 })async
 {
   dio.options.headers={
     'Content-Type':'application/json',
     'authorizatio':token,
   };
   return dio.post(
     url,
     queryParameters: query??null,
     data: data,
   );
 }*/
}

class DioHelper3{
  static Dio dio= Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      // headers: {
      //   'Content-Type':'application/json',
      //   'lang':'en',
      // }
    ),

  ) ;
  static init(){ //initialization for dio object
  }

  static Future<Response> GetData({
    required var url,
    Map <String,dynamic>? query,
    String lang ='en',
    String? token,
  })async{
    dio.options.headers={
      'lang':lang,
      'authorization':token??'',
      'Content-Type':'application/json',
    };
    return await dio.get(url ,
      queryParameters: query??null,);
  }



  static Future<Response> PostData({
    required var url,
    Map <String,dynamic>? query,
    required Map <String,dynamic> data,
    String lang ='en',
    String? token,
  })async
  {
    dio.options.headers={
      'lang':lang,
      'authorizatio':token??'',
      'Content-Type':'application/json',
    };
    return dio.post(
      url,
      queryParameters: query??null,
      data: data,
    );
  }



  static Future<Response> PutData({
    required var url,
    Map <String,dynamic>? query,
    required Map <String,dynamic> data,
    String lang ='en',
    String? token,
  })async
  {
    dio.options.headers={
      'lang':lang,
      'authorizatio':token??'',
      'Content-Type':'application/json',
    };
    return dio.put(
      url,
      queryParameters: query??null,
      data: data,
    );
  }



}


// class DioHelper3{
//   static  Dio dio=Dio(
//     BaseOptions(
//         baseUrl: 'https://student.valuxapps.com/api/',
//         receiveDataWhenStatusError: true,
//         // headers: {
//         //   'Content-Type':'application/json',
//         //   'lang':'en',
//         // }
//     ),
//   ) ;
//   // static init(){ //initialization for dio object
//   // }
//   static Future<Response> GetData({
//     required var url,
//     required Map <String,dynamic>? query,
//     String lang ='en',
//     String? token,
//   })async{
//     dio.options.headers={
//       'lang':lang,
//       'authorizatio':token,
//     };
//     return await dio.get(url , queryParameters: query,);
//   }
//
//
//   static Future<Response> PostData({
//     required var url,
//     Map <String,dynamic>? query,
//     required Map <String,dynamic> data,
//     String lang ='ar',
//     String? token,
//   })async
//   {
//     dio.options.headers={
//       'lang':lang,
//       'authorizatio':token,
//     };
//     return dio.post(
//       url,
//       queryParameters: query,
//       data: data,
//     );
//   }
// }
//
// class SoccerApi {
//   static Dio dio = Dio(
//     BaseOptions(
//       baseUrl: "https://v3.football.api-sports.io/fixtures?season=2020&league=39",
//       receiveDataWhenStatusError: true,
//       headers: {
//         'x-rapidapi-host': "v3.football.api-sports.io",
//         'x-rapidapi-key': "PUT YOUR API KEY HERE OR IT WILL NOT WORK"
//       },
//     ),
//
//   ) ;
//   // final String apiUrl =
//   //     "https://v3.football.api-sports.io/fixtures?season=2020&league=39";
//   // static const headers = {
//   //   'x-rapidapi-host': "v3.football.api-sports.io",
//   //   'x-rapidapi-key': "PUT YOUR API KEY HERE OR IT WILL NOT WORK"
//   // };
//
//   static Future<Response> GetData({
//     required String EndPoint,
//   })async{
//     return await dio.get(
//       EndPoint ,
//     );
//   }
//
//
// }