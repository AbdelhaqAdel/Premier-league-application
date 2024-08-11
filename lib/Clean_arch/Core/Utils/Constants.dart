import 'package:premleague/Clean_arch/Core/Utils/components.dart';

import '../../Features/Login/presentation/pages/UserLogin.dart';

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