import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maya3flutter_app/models/todobool.dart';

class myTodoProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Senior Developer Job ",
      description: ''' 
      * Ask for a raise
      * Work Hard!!
      * Take more Responsibilities ''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: " Travel Across the World ",
      description: '''  
      * Save up some money
      * Study about places and cultures to visit
      *  Meet new people along the way in different countries ''',
    ),
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
