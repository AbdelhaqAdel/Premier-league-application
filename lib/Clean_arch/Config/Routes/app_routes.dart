
import '../../premier.dart';
import '../../Features/on_boarding/presentation/pages/onBoardingScreen.dart';
import '../../Features/Stats/presentation/pages/StatsScreens/AssistsScreen.dart';
import '../../Features/Stats/presentation/pages/StatsScreens/CleanSheetScreen.dart';
import '../../Features/Stats/presentation/pages/StatsScreens/ScorersScreen.dart';
import '../../Features/Stats/presentation/pages/StatsScreens/TeamsGoalsScreen.dart';


class Routes {
  static const String initialRoute='/OnBoarding';
  static const String layout='/layoutScreen';
  static const String scorer='/ScorerScreen';
  static const String assist='/assistScreen';
  static const String goals='/goalsScreen';
  static const String cards='/cardsScreen';
  // static const String initialRoute='/layoutScreen';
}

final allRoutes ={
  Routes.initialRoute: (context)=>OnBoarding(),
  Routes.layout: (context)=>const premleague(),
  Routes.scorer: (context)=>const ScorersScreen(),
  Routes.assist: (context)=> AssitsScreen(),
  Routes.goals: (context)=> TeamsGoal(),
  Routes.cards: (context)=> CleanSheet(),
};
//
// class Routes {
//   static const String home = '/';
//   static const String scorers = '/scorers';
//
// }
//
// class AppRoutes {
//   static Route? onGenerateRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.home:
//         return MaterialPageRoute(builder: (_) => const premleague());
//         case Routes.scorers:
//           return MaterialPageRoute(builder: (_) => const ScorersScreen());
//
//     }
//     return null;
//   }

