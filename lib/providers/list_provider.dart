import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/TodoDM.dart';

class ListProvider extends ChangeNotifier {
  var selectedDate = DateTime.now();
  List<TodoDM> todos = [];

  getTodosFromFirestore() async {
    var todosCollection = FirebaseFirestore.instance.collection("todos");

    /// getting all todos from firestore
    var query = await todosCollection.get();
    todos = query.docs.map((doc){
      var data = doc.data();
      return  TodoDM(id: data["id"],
          title: data["title"],
          description: data["description"],
          date: DateTime.fromMillisecondsSinceEpoch(data["date"]),
          isDone: data["isDone"]);
    }).toList();

    /// filter list with selected date
    todos = todos.where((todo) {
      return todo.date.year == selectedDate.year
          && todo.date.month == selectedDate.month
          && todo.date.day == selectedDate.day;
    }).toList();
    /// Sort list
    todos.sort((todo1, todo2){
      return todo1.date.compareTo(todo2.date);
    });

    notifyListeners();
  }
  changeDate(DateTime newDate){
    selectedDate = newDate;
    getTodosFromFirestore();
  }
}