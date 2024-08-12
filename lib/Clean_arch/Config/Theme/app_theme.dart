import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Color.dart';

ThemeData appTheme = ThemeData(
  // scaffoldBackgroundColor: Colors.black,
  primarySwatch: AppColor.defaultColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.defaultColor,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.statusBarColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor:AppColor.backGroundColor,
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
);

// ThemeData(
//   appBarTheme: const AppBarTheme(
//       iconTheme: IconThemeData(
//         color: Color(0xff212121),
//       ),
//       systemOverlayStyle: SystemUiOverlayStyle(
//          // statusBarColor: ,
//           statusBarIconBrightness: Brightness.dark),
//       color: AppColor.layoutBackgroundColor,
//       elevation: 0,
//       titleTextStyle: TextStyle(
//           color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
//   textTheme: TextTheme(
//     titleMedium: const TextStyle(
//       fontSize: 30,
//       fontWeight: FontWeight.w600,
//       color: AppColor.darkTextColor,
//     ),
//     bodyLarge: const TextStyle(
//       fontSize: 50,
//       fontWeight: FontWeight.bold,
//       color: AppColor.darkTextColor,
//     ),
//     labelSmall: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: Colors.grey[500],
//     ),
//     labelMedium: const TextStyle(
//       fontSize: 15,
//       fontWeight: FontWeight.bold,
//       color: Colors.black,
//     ),
//     labelLarge: const TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.w500,
//       color: Colors.black,
//     ),
//     titleSmall: const TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.w400,
//       color: Colors.black,
//     ),
//     bodySmall: const TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w400,
//       color: Colors.black,
//     ),
//     bodyMedium: const TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w500,
//       color: AppColor.darkTextColor,
//     ),
//   ),
//   //iconTheme: const IconThemeData(color: AppColor.darkBackgroundColor),
// );
