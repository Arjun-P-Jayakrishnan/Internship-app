import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_do/homepage/task_tile.dart';

import '../models/task.dart';



class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {



  @override
  Widget build(BuildContext context) {
    final tasks =Provider.of<List<Task>?>(context)??[];
    print("tasks ${tasks}");
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context,index){
          return TaskTile(task:tasks[index]);
        }
    );
  }
}
