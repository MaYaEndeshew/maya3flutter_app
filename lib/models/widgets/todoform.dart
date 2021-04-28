import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class myTodoform extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedDate;
  final VoidCallback onSavedTodo;

  //constructorForTheTodoListForm
  const myTodoform({
    Key key,
    this.title = '',
    this.description = '',
    this.date = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onChangedDate,
    @required this.onSavedTodo,
  }) : super(key: key);

  //myTodo({this.title});

  @override
  Widget build(BuildContext context) => Container(
        color: Color(0xFF578659),
        child: SingleChildScrollView(
          //padding:EdgeInsets.only(top:10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 10),
              buildDescription(),
              SizedBox(height: 40),
              buildSavedbutton(),
              SizedBox(height: 10),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'Title cannot be Empty ';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        onChanged: onChangedDescription,
        /*validator:(description){
      if (title.isEmpty){
        return 'Description  cannot be Empty ';
      }
      return null;
    },*/

        decoration: InputDecoration(
            border: UnderlineInputBorder(), labelText: 'describe your goals'),
      );

  Widget buildSavedbutton() => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0x192F1D)),
        ),
        onPressed: onSavedTodo,
        child: Text('Save'),
      );
}
