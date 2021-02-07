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
          ListButton(
            ListIcon: Icons.access_time,
            ListText: 'Timezone',
            ListRoute: SetTimezone(),
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
  @override
  // useful links to start working on this...
  // https://pub.dev/packages/timezone
  // https://medium.com/flutter-community/working-with-timezones-in-flutter-1c304089dcf9
  // https://stackoverflow.com/questions/50780124/how-to-specify-a-timezone-when-creating-a-datetime-object-in-dart-flutter
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: ToDoAppBar(LogoName: 'assets/To_Do_Light.png')),
        drawer: Drawer(
          child: SideBar(),
        ),
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Text('Timezone - In Progress'),
        ));
  }
}

class ManageDevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: ToDoAppBar(LogoName: 'assets/To_Do_Light.png')),
        drawer: Drawer(
          child: SideBar(),
        ),
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Text('Manage Devices - In Progress'),
        ));
  }
}
