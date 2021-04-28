import 'package:flutter/material.dart';
import 'package:maya3flutter_app/models/global.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class navBar extends StatefulWidget {
  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(180),
                degOneTranslationAnimation.value * 100),
            child: CircularButton(
              color: secondaryColor,
              width: 40,
              height: 40,
              icon: Icon(FontAwesomeIcons.calendarTimes, color: Colors.white54),
              onClick: () {},
            ),
          ),
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(135),
                degOneTranslationAnimation.value * 100),
            child: CircularButton(
              color: background,
              width: 40,
              height: 40,
              icon: Icon(FontAwesomeIcons.sort, color: Colors.white54),
              onClick: () {},
            ),
          ),
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(90),
                degOneTranslationAnimation.value * 100),
            child: CircularButton(
              color: darkGreyColor,
              width: 40,
              height: 40,
              icon: Icon(FontAwesomeIcons.listAlt, color: Colors.white54),
              onClick: () {},
            ),
          ),
          CircularButton(
            color: primaryColor,
            width: 40,
            height: 40,
            icon: Icon(FontAwesomeIcons.ellipsisV, color: Colors.white54),
            onClick: () {
              if (animationController.isCompleted) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
          ),
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
