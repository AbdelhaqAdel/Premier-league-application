import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:premleague/Clean_arch/Core/Utils/Constants.dart';
import 'package:premleague/Clean_arch/Core/Utils/Strings/app_text.dart';
import 'package:premleague/Clean_arch/Core/Utils/git_it/standing_table_locator.dart';
import 'package:premleague/Clean_arch/Core/local/cache_helper.dart';
import 'package:premleague/Clean_arch/Features/Login/presentation/pages/UserLogin.dart';
import 'package:premleague/Clean_arch/Features/on_boarding/presentation/pages/onBoardingScreen.dart';
import 'package:premleague/Clean_arch/premier.dart';
import 'package:premleague/bloc_observer.dart';
import 'package:premleague/Clean_arch/Core/remote/DioHelper.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import 'Clean_arch/Config/Routes/app_routes.dart';
import 'Clean_arch/Config/Theme/app_theme.dart';
import 'Clean_arch/Features/Latest/domain/entities/matches_result_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
   DioHelper.init();
  DioHelper2.init();
   setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(MatchesResultEntityAdapter());
  await Hive.openBox<MatchesResultEntity>(AppText.matchesResultBox)
  .then((value){print('${AppText.matchesResultBox}  box is opened ');}).catchError((error){
    print('${AppText.matchesResultBox}  box is already opened ');
  });



  await CacheHelper.init();
 userToken =CacheHelper.getData(key: 'token');
 print('user token is ---- $userToken');

 if(userToken!=null){
  startWidget=Premleague();
 }else{
  startWidget= OnBoarding();
 }
 print(startWidget.toString());
 // bool? isDark = CacheHelper.getAllData(key: 'isDark');

 print('token from main is $userToken' );
  /*bool? onBoarding =CacheHelper.getAllData(key: 'onBoarding');
  print(onBoarding);*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  const MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PremCubitCubit()
        ..getMatchesTimeData()
        ..getCardsData()
       // ..getScorrersData()
        ..getAssistsData(),
      child: BlocConsumer<PremCubitCubit, PremCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
         return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_ , child) {
          return MaterialApp(
           // initialRoute:Routes.initialRoute,
            routes: allRoutes,
            theme:appTheme,
            debugShowCheckedModeBanner: false,
            home: startWidget!,
          );
          }
          );
        },
      ),
    );
  }
}
