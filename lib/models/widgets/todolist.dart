import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:maya3flutter_app/Screens/todos.dart';
import 'package:maya3flutter_app/provider/todo.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<myTodoProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'No Goals set up yet',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            padding: EdgeInsets.only(top: 150, left: 16, right: 16),
            physics: BouncingScrollPhysics(),
            //padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 10),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
