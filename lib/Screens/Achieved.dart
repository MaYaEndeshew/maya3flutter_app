import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:maya3flutter_app/models/global.dart';

class achievedGoal extends StatefulWidget {
  _achievedGoalState createState() => _achievedGoalState();
}

@override
class _achievedGoalState extends State<achievedGoal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150, left: 0, right: 5),
      padding: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "No Achieved Goals yet ",
            style: homeTitleStyle,
          ),
        ],
      ),
    );
  }
}
