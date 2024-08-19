import 'package:flutter/widgets.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double h(double percentage) {
    var h = percentage / 926;
    return MediaQuery.of(this).size.height * h;
  }

  double w(double percentage) {
    var w = percentage / 428;
    return MediaQuery.of(this).size.width * w;
  }

  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  // showAwesomeSnackbar({
  //   required String message,
  //   required String title,
  //   required ContentType contentType,
  // }) {
  //   final snackBar = SnackBar(
  //     elevation: 0,
  //     clipBehavior: Clip.none,
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     duration: const Duration(milliseconds: 2000),
  //     content: AwesomeSnackbarContent(
  //       title: title,
  //       message: message,
  //       contentType: contentType,
  //     ),
  //   );

  //   return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  // }

  // jumpTo(newScreen) =>
  //     Navigator.push(this, MaterialPageRoute(builder: (contxet) => newScreen));
  // jumpToWithReplacement(newScreen) => Navigator.pushReplacement(
  //     this, MaterialPageRoute(builder: (contxet) => newScreen));
  // jumpToAndRemove(newScreen) => Navigator.pushAndRemoveUntil(
  //     this,
      // MaterialPageRoute(builder: (contxet) => newScreen),
      // (Route<dynamic> route) => false);
}


