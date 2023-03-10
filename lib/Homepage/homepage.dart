import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_do/services/auth.dart';
import 'package:task_do/services/databaseFirebase.dart';
import 'package:task_do/shared/login_credentials.dart';

import '../models/task.dart';
import '../shared/constants.dart';
import 'TaskList.dart';














class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final AuthService _auth=AuthService();
  GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  var _loginId="";

  void loadUserId() async{
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    setState(() {
      print("The login id is ${_prefs.getString('userAnon')}");
      _loginId=_prefs.getString('userAnon') ?? LoginCredentials().resetUser();

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserId();
  }

  String _taskData="Task Details";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Task App"),
        centerTitle: true,
      ),

      body:Column(
        children: [
          SizedBox(height: 20.0),
          Form(
            key:_formKey,
            child: Row(
              children: [
                SizedBox(width:10.0),
                Expanded(child: TextFormField(
                  decoration: inputDecoration,
                  validator: (value){
                    if(value == null|| value.isEmpty){
                      return "Please Enter some text";
                    }
                    else{
                      return null;
                    }
                  },
                  onChanged: (val){
                    setState(() {
                      _taskData=val;
                    });
                  },
                )),
                SizedBox(width:10.0,),
                FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () async{
                      if(_formKey.currentState!.validate()) {

                        dynamic result = await DatabaseServices().addTask(_taskData);
                      }
                      } )
              ],
            ),
          ),
          Expanded(
            child:StreamProvider<List<Task>?>.value(
              initialData: null,
              value: DatabaseQuery().taskList,
              child: TaskList(),
            ),
          ),


          ],
      )
          );

  }
}
