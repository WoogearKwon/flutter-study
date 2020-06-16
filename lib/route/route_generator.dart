import 'package:flutter/material.dart';
import 'package:startupnamer/dicee.dart';
import 'package:startupnamer/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments possed in while calling Navigator.pushNa ed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MiCard());
      case '/dicee':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Dicee()
          );
        }
       // If args is not of the correct type, return an error page.
       // You can also throw an exception while in development.
        return _errorRoute();
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