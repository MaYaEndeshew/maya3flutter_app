import 'package:flutter/material.dart';
import 'package:maya3flutter_app/models/global.dart';
import 'package:maya3flutter_app/models/navigation_model.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 220;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  Widget getWidget(context, widget) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
          color: primaryColor,
          boxShadow: [
            new BoxShadow(
              color: greyColor,
              blurRadius: 2.0,
            )
          ]),

      width: widthAnimation.value,
      //color: Colors.green[800],

      child: Column(
        children: <Widget>[
          Divider(
            color: Colors.blueGrey,
            height: 20.0,
          ),
          SizedBox(height: 40.0),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, counter) {
                return Divider(height: 12.0);
              },
              itemBuilder: (context, counter) {
                return CollapsingListTitle(
                  onTap: () {
                    setState(() {
                      currentSelectedIndex = counter;
                    });
                  },
                  isSelected: currentSelectedIndex == counter,
                  title: navItems[counter].title,
                  icon: navItems[counter].icon,
                  animationController: _animationController,
                );
              },
              itemCount: navItems.length,
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.reverse()
                      : _animationController.forward();
                });
              },
              child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _animationController,
                  color: baseColor,
                  size: 40.0)),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}

//For the collapsing List Title

class CollapsingListTitle extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;

  CollapsingListTitle(
      {@required this.title,
      @required this.icon,
      @required this.animationController,
      this.isSelected = false,
      this.onTap});

  @override
  _CollapsingListTitleState createState() => _CollapsingListTitleState();
}

class _CollapsingListTitleState extends State<CollapsingListTitle> {
  Animation<double> widthAnimation;
  Animation<double> sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 70, end: 220).animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 0, end: 10).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: widget.isSelected
              ? baseColor
              : Colors.transparent.withOpacity(0.1),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Icon(widget.icon,
                color: widget.isSelected ? blackityblack : light, size: 28.0),
            SizedBox(width: sizedBoxAnimation.value),
            (widthAnimation.value >= 190)
                ? Text(widget.title,
                    style:
                        widget.isSelected ? homeTitleStyle : secondTitleStyle)
                : Container(),
          ],
        ),
      ),
    );
  }
}
