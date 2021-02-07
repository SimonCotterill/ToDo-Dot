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
