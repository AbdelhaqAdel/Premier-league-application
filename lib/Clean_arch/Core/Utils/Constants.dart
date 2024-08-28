import 'package:flutter/material.dart';
import 'package:premleague/Clean_arch/Core/Utils/components.dart';

import '../../Features/Login/presentation/pages/UserLogin.dart';

String? userToken;
Widget? startWidget;

String? ss;
void logOut(context){
  userToken=null;
  navigateAndFinish(context, UserLogin());
  // CachHelper.removedata(key: 'token').then((value)
  // {
  //   if(value==true){
  //     NavigationAndFinish(context, ShopLogin());
  //   }
  // }
  // );
}
// b