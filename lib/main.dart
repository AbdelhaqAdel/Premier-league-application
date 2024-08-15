import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premleague/Clean_arch/Core/Utils/Strings/app_text.dart';
import 'package:premleague/Clean_arch/Core/Utils/git_it/standing_table_locator.dart';
import 'package:premleague/Clean_arch/Features/on_boarding/presentation/pages/onBoardingScreen.dart';
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
  await Hive.openBox<MatchesResultEntity>(AppText.matchesResultBox).then((value){print('allCoursesBox4  box is opened ');}).catchError((error){
    print('allCoursesBox4  box is already opened ');
  });



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
