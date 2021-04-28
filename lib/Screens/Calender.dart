import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:maya3flutter_app/models/global.dart';

class goalcalender extends StatefulWidget {
  _goalcalenderState createState() => _goalcalenderState();
}

class _goalcalenderState extends State<goalcalender> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: background,
            margin: EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TableCalendar(
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(
                        weekdayStyle: homeTitleStyle,
                        weekendStyle: homeTitleStyle,
                        selectedColor: light,
                        todayColor: blackityblack,
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: homeTitleStyle,
                          weekendStyle: homeTitleStyle),
                      calendarController: _controller),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 40),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50)),
                        color: darkGreyColor,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Text("Today", style: secondTitleStyle),
                              )
                            ],
                          )
                        ],
                      )),
                ],
              ),
            )));
  }
}
