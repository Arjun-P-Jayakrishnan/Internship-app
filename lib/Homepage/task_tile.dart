import 'package:flutter/material.dart';
import 'package:task_do/services/databaseFirebase.dart';
import 'package:task_do/shared/login_credentials.dart';

import '../models/task.dart';




class TaskTile extends StatelessWidget {

  final Task task;
  TaskTile({required this.task});




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
              initialValue: "${task.taskLabel}",
              readOnly:true,
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
                    dynamic result= await DatabaseServices(uid: LoginCredentials.LoginId).updateTask("Hello",task.docId);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async{
                      dynamic result =await DatabaseServices(uid:LoginCredentials.LoginId).deleteTask(task.docId);
                  })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
