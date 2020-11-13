import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import '../model/task_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // replace ListView into Consumer Widget so we can get data from Provider
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              // widget refers to the stateful widget which of course gets that property
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (checkboxState) {
                  // setState(() {
                  //   Provider.of<TaskData>(context).tasks[index].toggleDone();
                  // });
                },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
