import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
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
      ),
    );
  }
}
