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
          // use SideButton custom class???
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Timezone'),
          ),
          ListTile(
            leading: Icon(Icons.add_alarm),
            title: Text('Manage Devices'),
          ),
        ],
      ),
    );
  }
}
