import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maya3flutter_app/Screens/Calender.dart';
import 'package:maya3flutter_app/Screens/Achieved.dart';
import 'package:maya3flutter_app/models/widgets/sidebar.dart';
import 'package:maya3flutter_app/models/widgets/todolist.dart';
import 'package:maya3flutter_app/models/global.dart';
import 'package:maya3flutter_app/models/widgets/add_to_do.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String title = 'Goal Planner';

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                title: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: _googlePlayAppBar(),
                ),
                bottom: TabBar(
                    isScrollable: true,
                    indicatorColor: baseColor,
                    indicatorWeight: 3.0,
                    tabs: <Widget>[
                      Tab(
                        text: 'Pending Goal List',
                        icon: Icon(Icons.list_alt_rounded),
                      ),
                      Tab(
                        text: 'Achieved Goals',
                        icon: Icon(Icons.check_box),
                      ),
                      Tab(
                        text: 'Calender Entry',
                        icon: Icon(Icons.calendar_today_sharp),
                      ),
                    ]),
              ),
              body: SafeArea(
                  child: Container(
                width: size.width,
                height: size.height,
                color: baseColor,
                child: Stack(children: <Widget>[
                  TabBarView(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 70), child: TodoList()),
                      Container(
                          margin: EdgeInsets.only(left: 70),
                          child: achievedGoal()),
                      Container(
                          margin: EdgeInsets.only(left: 70),
                          child: goalcalender()),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: primaryColor,
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 120,
                        ),
                        Text(
                          "Goal Planner ",
                          style: secondTitleStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.7,
                        left: MediaQuery.of(context).size.width * 0.85),
                    height: 30,
                    width: 40,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.add, color: blackityblack),
                      backgroundColor: primaryColor,
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => AddToDoButton(),
                        barrierDismissible: true,
                      ),
                    ),
                  ),
                  Container(
                    child: CollapsingNavigationDrawer(),
                  ),
                ]),
              )),
            )));
  }
}

Widget _googlePlayAppBar() {
  return Container(
    color: Colors.white54,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.search, color: Colors.white54),
              onPressed: () {},
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.ellipsisV, color: Colors.white54),
              onPressed: () {},
            ),
          ),
        ]),
  );
}
