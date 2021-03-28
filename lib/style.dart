import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// project colors
const Color todoLightGrey = Color(0xFFe9e9f2);
const Color todoDarkGrey = Color(0xFFd3d1dd);
const Color todoBlue = Color(0xFF6594a3);
const Color todoDarkGreen = Color(0xFF214e4c);
const Color todoMediumGreen = Color(0xFF589590);
const Color todoLightGreen = Color(0xFFdce9e8);

// Main App Bar for App
// value is only set once
// ignore: must_be_immutable
class ToDoAppBar extends StatelessWidget {
  final String headerImage;
  bool isSubPage;

  ToDoAppBar({
    this.headerImage,
    this.isSubPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //https://stackoverflow.com/questions/55826789/flutter-rounded-corners-in-sliverappbar
      elevation: 25.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5.0),
        ),
      ),
      backgroundColor: todoDarkGreen,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        // Source: https://stackoverflow.com/questions/43981406/how-to-center-the-title-of-an-appbar
        children: [
          //todo: COMMENT: Maybe text or image? both might be a little much
          // Removed: Text('Home Page'),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Image.asset(headerImage, fit: BoxFit.contain, height: 50),
          ),
        ],
      ),

      // https://stackoverflow.com/questions/59554348/how-can-i-change-drawer-icon-in-flutter
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 12, 0, 0),
            child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: todoLightGrey,
                  size: 40,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
          );
        },
      ),

      actions: <Widget>[
        isSubPage
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 5, 0),
                child: new IconButton(
                  icon: Icon(
                    Icons.close,
                    color: todoLightGrey,
                    size: 40,
                  ),
                  onPressed: () => Navigator.of(context).pop(null),
                ),
              )
            : Container(),
      ],
    );
  }
}

// Button widget https://www.youtube.com/watch?v=h6OmR0TpWJU&ab_channel=LuisTheTechGuy%21
class HomeButton extends StatelessWidget {
  @required
  final IconData icon;
  @required
  final String text;
  final StatefulWidget routestful;
  final StatelessWidget routestless;
  @required
  final bool isStLess;

  const HomeButton({
    this.icon,
    this.text,
    this.routestful,
    this.routestless,
    this.isStLess,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 160.0,
        height: 180.0,
        child: Card(
            color: todoBlue,
            elevation: 15.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0)),
            //https://flutter.dev/docs/cookbook/gestures/ripples
            //https://stackoverflow.com/questions/44317188/flutter-ontap-method-for-containers
            child: InkWell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                child: Column(children: <Widget>[
                  Icon(
                    icon,
                    color: todoLightGrey,
                    size: 80.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: todoLightGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ]),
              ),
              onTap: () => {
                isStLess
                    ? Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => routestless))
                    : Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => routestful))
              },
            )));
  }
}

//SideBar Buttons
class SideButton extends StatelessWidget {
  @required
  final IconData icon;
  @required
  final String text;
  final StatefulWidget routestful;
  final StatelessWidget routestless;
  @required
  final bool isStLess;

  const SideButton({
    this.icon,
    this.text,
    this.routestful,
    this.routestless,
    this.isStLess,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => {
              isStLess
                  ? Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => routestless))
                  : Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => routestful))
            },
        leading: Icon(
          icon,
          color: todoMediumGreen,
          size: 40.0,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: todoMediumGreen,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ));
  }
}

//Settings List Buttons
class ListButton extends StatelessWidget {
  @required
  final IconData icon;
  @required
  final String text;
  final StatefulWidget routestful;
  final StatelessWidget routestless;
  @required
  final bool isStLess;

  const ListButton({
    this.icon,
    this.text,
    this.routestful,
    this.routestless,
    this.isStLess,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => {
              isStLess
                  ? Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => routestless))
                  : Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => routestful))
            },
        leading: Icon(
          icon,
          color: todoBlue,
          size: 40.0,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: todoBlue,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ));
  }
}

// Calendar Task Container

class TaskContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color boxColor;

  TaskContainer({
    this.title,
    this.subtitle,
    this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        //TODO: on tap goes to the task
        /* onTap: () => {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ))
        },  */
      ),
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(30.0)),
    );
  }
}

class CalendarDates extends StatelessWidget {
  final String day;
  final String date;
  final Color dayColor;
  final Color dateColor;

  CalendarDates({this.day, this.date, this.dayColor, this.dateColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            day,
            style: TextStyle(
                fontSize: 16, color: dayColor, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10.0),
          Text(
            date,
            style: TextStyle(
                fontSize: 16, color: dateColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
