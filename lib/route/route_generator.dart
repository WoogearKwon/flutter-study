import 'package:flutter/material.dart';
import 'package:startupnamer/page/magic_8_ball.dart';
import '../page/pages.dart';

class Routes {
  static const String root = '/';
  static const String miCard = '/micard';
  static const String dicee = '/dicee';
  static const String magicBall = '/magicball';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments possed in while calling Navigator.pushNa ed
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(builder: (_) => StudyList());
      case Routes.miCard:
        return MaterialPageRoute(builder: (_) => MiCard());
      case Routes.dicee:
        return MaterialPageRoute(builder: (_) => Dicee());
      case Routes.magicBall:
        return MaterialPageRoute(builder: (_) => MagicEightBall());
      default:
        // If there is no such named route in the switch statement, e.g. / third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}