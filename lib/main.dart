import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/layout/premleaguePro/premier.dart';
import 'package:premleague/modules/On_boarding/onBoardingScreen.dart';
import 'package:premleague/shared/component/Constants.dart';
import 'package:premleague/shared/component/bloc_observer.dart';
import 'package:premleague/shared/network/local/cache_helper.dart';
import 'package:premleague/shared/network/remote/DioHelper.dart';
import 'package:premleague/shared/styles/colors.dart';
import 'package:premleague/shared/styles/thems.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
   DioHelper.init();
  //Token =CacheHelper.getAllData(key: 'token');
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
            theme: ThemeData(
              // scaffoldBackgroundColor: Colors.black,
              primarySwatch: defultColor,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: defultColor,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                //type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.purpleAccent,
                unselectedItemColor: Colors.grey[300],
                // elevation: 30,
                backgroundColor: Colors.transparent,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            //LightTheme,
            // darkTheme:darkTheme,
            //themeMode:ThemeMode.light,
            /*appcubit.get(context).isDark?ThemeMode.dark :*/
            home: OnBoarding(),
          );
        },
      ),
    );
  }
}
