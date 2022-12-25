import 'dart:convert';

import "package:cloud_firestore/cloud_firestore.dart";


import '../models/task.dart';
import '../models/user_model.dart';




class DatabaseServices{





  //Firebase reference
  final CollectionReference taskCollection=FirebaseFirestore.instance.collection("tasks");

  Future addTask(String task) async{

    return await taskCollection.add({'task':task,});

  }

  Future updateTask(String task,String docId) async{

    print("uid ${docId}");
    return await taskCollection.doc(docId).set({
      'task':task,
    });
  }

  Future deleteTask(String docId) async{

    return await taskCollection.doc(docId).delete();
  }


}

//non uid related queries
class DatabaseQuery{

  final CollectionReference taskCollection=FirebaseFirestore.instance.collection("tasks");

  List<Task> _taskListFromSnapshot(QuerySnapshot snapshot){

    return snapshot.docs.map((docValue) {
          print("doc Value ${docValue.data()}");
          String docVal=jsonEncode(docValue.data());
          Map<String,dynamic> docValueJson=jsonDecode(docVal);
          print("${docValue.id}");
          return Task(taskLabel:docValueJson["task"]??"",docId: docValue.id);
      }
    ).toList();

  }

  Stream<QuerySnapshot> get tasks{
    print("database query task ${taskCollection.snapshots()}");
    return taskCollection.snapshots();

  }

  Stream<List<Task>> get taskList{
    return taskCollection.snapshots().map(_taskListFromSnapshot);
  }


}