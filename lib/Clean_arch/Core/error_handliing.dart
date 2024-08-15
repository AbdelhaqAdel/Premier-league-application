import 'package:dio/dio.dart';

abstract class Failure{
  String message;
  Failure(this.message);
}

class ServerFailure extends Failure{
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError e){
    switch (e.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioErrorType.sendTimeout:
      return ServerFailure('Send timeout with API server');

      case DioErrorType.receiveTimeout:
      return ServerFailure('Receive timeout with API server');

      case DioErrorType.response:
      return ServerFailure.responseError(e.response!.statusCode!, e.response);
      case DioErrorType.cancel:
      return ServerFailure('Request from API was canceled');

      case DioErrorType.other:
      return ServerFailure('Opps. there was an error, please try again');
    }
  }

  factory ServerFailure.responseError(int statusCode,dynamic response){
     if(statusCode==404){ 
      return ServerFailure('Your request not found, please try later');
     }else if(statusCode==500){
      return ServerFailure('there is a problem with server please try again');

     }else if(statusCode==400||statusCode==401||statusCode==403){
      //---its depend on message from api response
      return ServerFailure('Message from Api');
     }else{
      return ServerFailure('there was an error please try again');
     }
  }

}