import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startupnamer/page/todoey/model/task_data.dart';
import 'package:startupnamer/route/route_generator.dart';

// void main() => runApp(MyApp());
void main() => runApp(
  ChangeNotifierProvider(
    create: (BuildContext context) => TaskData(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.kRoot,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}