import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:maya3flutter_app/models/todobool.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          secondaryActions: [
            IconSlideAction(
              color: Colors.lightBlue,
              onTap: () {},
              caption: 'Edit',
              icon: Icons.edit,
            ),
            IconSlideAction(
              color: Colors.red,
              onTap: () {},
              caption: 'Delete',
              icon: Icons.delete,
            ),
          ],
          child: buildTodo(context)),
    );
  }

  Widget buildTodo(BuildContext context) => Container(
        //margin: EdgeInsets.only(top: 15,left:15,right: 15),
        //height: 200,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            //color:Color(0x9A4EAF53),
            color: Colors.orangeAccent,
            boxShadow: [
              new BoxShadow(
                color: Colors.green,
                blurRadius: 10.0,
              )
            ]),

        child: Row(children: [
          Checkbox(
            activeColor: Colors.blueGrey,
            checkColor: Colors.black87,
            value: todo.isDone,
            onChanged: (_) {
              // ignore: unnecessary_statements
              Colors.blueAccent[200];
            },
          ),
          const SizedBox(width: 15, height: 100),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      todo.description,
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  ),
              ],
            ),
          ),
        ]),
      );
}
