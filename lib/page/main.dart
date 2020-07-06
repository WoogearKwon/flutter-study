import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startupnamer/route/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.kRoot,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}