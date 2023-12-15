import 'package:premleague/shared/component/components.dart';

import '../../modules/On_boarding/User_info/Login/UserLogin.dart';

String? Token;

String? ss;
void LogoOut(context){
  Token=null;
  NavigationAndFinish(context, UserLogin());
  // CachHelper.removedata(key: 'token').then((value)
  // {
  //   if(value==true){
  //     NavigationAndFinish(context, ShopLogin());
  //   }
  // }
  // );
}
// b