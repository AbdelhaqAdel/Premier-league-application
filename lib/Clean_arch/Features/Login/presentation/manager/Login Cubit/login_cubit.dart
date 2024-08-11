// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../../../../../../model/StandingsModel.dart';
// import '../../../../../../../model/user/shop_model/LoginModel.dart';
// import '../../../../../../../shared/network/endPoints.dart';
// import '../../../../../../../shared/network/remote/DioHelper.dart';
//
// part 'login_state.dart';
//
// class LoginCubit extends Cubit<ShopLoginState> {
//   LoginCubit() : super(shopLoginInitialState());
//
//   static LoginCubit get(context)=> BlocProvider.of(context);
//   IconData suffix=Icons.visibility_outlined;
//   bool ispassowrdShown=true;
//   shopLoginModel ?loginModel;
//   void UserLogin({
//     required String email,
//     required String password,
// }){
//     emit(shopLoginLoadingState());
//     DioHelper3.PostData(
//         url: LOGIN,
//         data:{
//           'email':email,
//           'password':password,
//         }).then((value) {
//        loginModel= shopLoginModel.fromJson(value.data);
//        emit(shopLoginSuccessState(loginModel!));
//        print(value.data);
//         }).catchError((Error){
//           print(Error.toString());
//         emit(shopLoginErrorState(Error.toString()));
//       });
//   }
// void changePasswordVisibility(){
//   ispassowrdShown=!ispassowrdShown;
//
//     suffix=ispassowrdShown?Icons.visibility_off_outlined:Icons.visibility_outlined;
//   emit(shopLoginIsbasswordState());
// }
//   List<StandingsModel>standings=[];
//   void getTeamsData(){
//     emit(premTeamsLoadingState());
//     //  ss.getAllScorers();
//     DioHelper.GetData(
//       EndPoint: STANDINGS,
//     ).then((value) {
//       if(value.statusCode==200){
//         // var Json= json.decode(jsonEncode(value.data));
//
//         List Json = value.data['standings'][0]['table'];
//
//         for (var element in Json) {
//           standings.add(StandingsModel.fromJson(element));
//
//         }
//         emit(premTeamsSuccessState(standings));
//       }}).catchError((onError){
//       print(onError.toString());
//       emit(premTeamsErrorState());
//     });
//   }
// }
