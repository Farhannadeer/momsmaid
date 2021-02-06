import 'package:flutter/material.dart';
import 'package:momsmaid/screens/home.dart';
import 'package:momsmaid/screens/image1.dart';
import 'package:momsmaid/screens/image2.dart';
import 'package:momsmaid/screens/image3.dart';
import 'package:momsmaid/screens/splash_screen.dart';
import 'package:momsmaid/screens/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';


class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case 'home':
        return PageTransition(
            child: HomeScreen(), type: PageTransitionType.fade);

      case 'image1':
        return PageTransition(
            child: Image1(), type: PageTransitionType.fade);

      case 'image2':
        return PageTransition(
            child: Image2(), type: PageTransitionType.fade);

      case 'image3':
      return PageTransition(
          child: Image3(), type: PageTransitionType.fade);

      case 'welcome':
        return PageTransition(
            child: WelcomeScreen(), type: PageTransitionType.fade);

    }
  }
}