import 'package:dio/dio.dart';

abstract class Failure{
  String message;
  Failure(this.message);
}

class ServerFailuer extends Failure{
  ServerFailuer(super.message);

  factory ServerFailuer.FromDioError(DioError e){
    switch (e.type) {
      case DioErrorType.connectTimeout:
        return ServerFailuer('Connection timeout with API server');
      case DioErrorType.sendTimeout:
      return ServerFailuer('Send timeout with API server');

      case DioErrorType.receiveTimeout:
      return ServerFailuer('Recieve timeout with API server');

      case DioErrorType.response:
      return ServerFailuer.responseError(e.response!.statusCode!, e.response);
      case DioErrorType.cancel:
      return ServerFailuer('Request from API was canceld');

      case DioErrorType.other:
      return ServerFailuer('opps there was an error, please try again');
    }
  }

  factory ServerFailuer.responseError(int statusCode,dynamic response){
     if(statusCode==404){ 
      return ServerFailuer('Your request not found, please try later');
     }else if(statusCode==500){
      return ServerFailuer('there is a problem with server please try again');

     }else if(statusCode==400||statusCode==401||statusCode==403){
      //---its depend on message from api response
      return ServerFailuer('Message from Api');
     }else{
      return ServerFailuer('there was an error please try again');
     }
  }

}