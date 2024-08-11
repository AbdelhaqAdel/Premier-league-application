import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/premier.dart';
import 'package:premleague/Clean_arch/Features/on_boarding/presentation/pages/onBoardingScreen.dart';
import 'package:premleague/Clean_arch/Core/Utils/Constants.dart';
import 'package:premleague/bloc_observer.dart';
import 'package:premleague/Clean_arch/Core/local/cache_helper.dart';
import 'package:premleague/Clean_arch/Core/remote/DioHelper.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

import 'Clean_arch/Config/Routes/app_routes.dart';
import 'Clean_arch/Config/Theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
   DioHelper.init();

//   await CacheHelper.init();
//  Token =CacheHelper.getAllData(key: 'token');
 // bool? isDark = CacheHelper.getAllData(key: 'isDark');

 // print('token from main is ${Token}' );
 // Token = CacheHelper.getAllData(key: 'token');
  /*bool? onBoarding =CacheHelper.getAllData(key: 'onBoarding');
  print(onBoarding);*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PremCubitCubit()
        ..getMatchesTimeData()
        ..getMatchesResultsData()
        ..getStandingsData()
        ..getCardsData()
        ..getScorrersData()
        ..getAssistsData(),
      child: BlocConsumer<PremCubitCubit, PremCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            initialRoute:Routes.initialRoute,
            routes: allRoutes,
            theme:appTheme,
            debugShowCheckedModeBanner: false,
            home: OnBoarding(),
          );
        },
      ),
    );
  }
}
