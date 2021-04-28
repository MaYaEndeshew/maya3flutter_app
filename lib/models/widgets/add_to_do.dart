import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maya3flutter_app/models/widgets/todoform.dart';

class AddToDoButton extends StatefulWidget {
  @override
  _AddToDoButtonState createState() => _AddToDoButtonState();
}

class _AddToDoButtonState extends State<AddToDoButton> {
  String title = '';
  String description = '';
  String date = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Container(
          color: Color(0xFF578659),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set Your Goals',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              myTodoform(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onChangedDate: (date) => setState(() => this.date = date),
                onSavedTodo: () {},
              ),
            ],
          ),
        ),
      );
}
