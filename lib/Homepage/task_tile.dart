import 'package:flutter/material.dart';
import 'package:task_do/services/databaseFirebase.dart';
import '../models/task.dart';









class TaskTile extends StatefulWidget {
  final Task task;
  TaskTile({required this.task});

  @override
  State<TaskTile> createState() => _TaskTileState();
}



class _TaskTileState extends State<TaskTile> {



  String _taskDetails="";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top:10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child:ListTile(
          leading: Icon(Icons.done),
          title: SizedBox(
            child: TextFormField(
              initialValue: "${widget.task.taskLabel}",
              onChanged: (val){
                setState((){
                      _taskDetails=val;
                });
              },
              onTapOutside: (val) async{
                dynamic result= await DatabaseServices().updateTask(_taskDetails, widget.task.docId);
              },
            ),
          ),
          trailing: SizedBox(
            height: 50.0,
            width: 100.0,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async{
                    dynamic result= await DatabaseServices().updateTask(_taskDetails,widget.task.docId);
                  },
                ),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async{
                      dynamic result =await DatabaseServices().deleteTask(widget.task.docId);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

