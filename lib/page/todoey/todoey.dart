import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startupnamer/page/todoey/model/task_data.dart';
import 'package:startupnamer/page/todoey/screens/tasks_screen.dart';

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TaskData(),
        child: TasksScreen()
    );
  }
}
