import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import '../model/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(

          // widget refers to the stateful widget which of course gets that property
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          }
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
