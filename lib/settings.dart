import 'package:flutter/material.dart';
import 'style.dart';
import 'sidebar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(LogoName: 'assets/To_Do_Light.png')),
      drawer: Drawer(
        child: SideBar(),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          ListButton(
            ListIcon: Icons.access_time,
            ListText: 'Timezone',
            ListRoute: SetTimezone(),
          ),
          SizedBox(
            height: 20,
          ),
          ListButton(
            ListIcon: Icons.add_alarm,
            ListText: 'Manage Devices',
            ListRoute: ManageDevices(),
          ),
        ],
      ),
    );
  }
}

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
      .padLeft(2, '0');

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
                    'Timezone: ',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(timezone, style: TextStyle(fontSize: 25)),
                ]),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      'Offset from UTC: ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(offsetHours + ':' + offsetMinutes,
                        style: TextStyle(fontSize: 25)),
                  ],
                )
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
