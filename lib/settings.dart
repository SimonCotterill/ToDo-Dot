import 'package:flutter/material.dart';
import 'style.dart';
import 'sidebar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
      drawer: Drawer(
        child: SideBar(),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          ListButton(
            icon: Icons.access_time,
            text: 'Timezone',
            route: SetTimezone(),
          ),
          SizedBox(
            height: 20,
          ),
          ListButton(
            icon: Icons.add_alarm,
            text: 'Manage Devices',
            route: ManageDevices(),
          ),
        ],
      ),
    );
  }
}

// value is only set once and not changed
// ignore: must_be_immutable
class SetTimezone extends StatelessWidget {
  String timezone = DateTime.now().timeZoneName;

  //assume all timezone offsets occur in hours + minutes (no seconds)
  String offsetHours = DateTime.now().timeZoneOffset.inHours.toString();
  //get offset minutes not including the hours, by taking remainder
  //https://stackoverflow.com/questions/60854312/datetime-flutter-format
  String offsetMinutes = (DateTime.now().timeZoneOffset.inMinutes %
              (DateTime.now().timeZoneOffset.inHours == 0
                  ? 60
                  : DateTime.now().timeZoneOffset.inHours * 60))
          .toString()
          .padLeft(2, '0') +
      " hours";

  @override
  // useful links to start working on this...
  // https://pub.dev/packages/timezone
  // https://medium.com/flutter-community/working-with-timezones-in-flutter-1c304089dcf9
  // https://stackoverflow.com/questions/50780124/how-to-specify-a-timezone-when-creating-a-datetime-object-in-dart-flutter
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: ToDoAppBar(
              LogoName: 'assets/To_Do_Light.png',
              isSubPage: true,
            )),
        drawer: Drawer(
          child: SideBar(),
        ),
        body: Container(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                Row(children: <Widget>[
                  Text(
                    'Timezone',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(height: 20),
                Row(children: <Widget>[
                  Text(
                    timezone,
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
                SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    Text(
                      'Offset from UTC',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      offsetHours + ':' + offsetMinutes,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ],
            )));
  }
}

class ManageDevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: ToDoAppBar(
              LogoName: 'assets/To_Do_Light.png',
              isSubPage: true,
            )),
        drawer: Drawer(
          child: SideBar(),
        ),
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'Manage Devices - In Progress',
            style: TextStyle(fontSize: 25),
          ),
        ));
  }
}
