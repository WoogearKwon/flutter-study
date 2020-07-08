import 'package:flutter/material.dart';
import 'package:startupnamer/page/skeleton/calculate_brain.dart';
import 'pages.dart';

class Routes {
  static const String kRoot = '/';
  static const String kMiCard = '/micard';
  static const String kDicee = '/dicee';
  static const String kMagicBall = '/magicball';
  static const String kXylophone = '/xylophone';
  static const String kQuizzler = '/quizzler';
  static const String kDestiny = '/destiny';
  static const String kTimer = '/timer';
  static const String kSkeleton = '/skeleton';
  static const String kBMICalculator = '/calculator';
  static const String kClima = '/clima';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.kRoot:
        return MaterialPageRoute(builder: (_) => StudyListPage());
      case Routes.kMiCard:
        return MaterialPageRoute(builder: (_) => MiCard());
      case Routes.kDicee:
        return MaterialPageRoute(builder: (_) => Dicee());
      case Routes.kMagicBall:
        return MaterialPageRoute(builder: (_) => MagicEightBall());
      case Routes.kXylophone:
        return MaterialPageRoute(builder: (_) => Xylophone());
      case Routes.kQuizzler:
        return MaterialPageRoute(builder: (_) => Quizzler());
      case Routes.kDestiny:
        return MaterialPageRoute(builder: (_) => Destini());
      case Routes.kTimer:
        return MaterialPageRoute(builder: (_) => Timer());
      case Routes.kSkeleton:
        return MaterialPageRoute(builder: (_) => Skeleton());
      case Routes.kBMICalculator:
        if (args is CalculatorBrain)
          return MaterialPageRoute(builder: (_) => ResultsPage(calc: args,));
        return _errorRoute();
      case Routes.kClima:
        return MaterialPageRoute(builder: (_) => Clima());

    // If there is no such named route in the switch statement, e.g. / third
      default:
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