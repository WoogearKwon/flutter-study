import 'package:flutter/material.dart';
import 'package:startupnamer/page/todoey/screens/tasks_screen.dart';

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TasksScreen();

    /// ChangeNotifierProvider의 위치가 이곳에 있으면 scope의 제한이 걸려 제대로 동작하지 않는다.
    /// 최상위 스코프인 main.dart로 이동해야 한다.
    // return ChangeNotifierProvider(
    //     create: (context) => TaskData(),
    //     child: TasksScreen()
    // );
  }
}
