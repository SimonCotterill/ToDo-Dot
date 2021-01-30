import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Dashboard(),
    ));

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFdce9e8),
        appBar: AppBar(
            backgroundColor: Color(0xFF6594a3),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              // Source: https://stackoverflow.com/questions/43981406/how-to-center-the-title-of-an-appbar
              children: [
                //todo: COMMENT: Maybe text or image? both might be a little much
                // Removed: Text('Home Page'),
                Image.asset('assets/ToDo_Logo.png',
                    fit: BoxFit.contain, height: 32),
              ],
            ),
            leading: new IconButton(
              icon: Icon(
                Icons.menu,
                color: Color(0xFFdce9e8),
                size: 40,
              ),
              onPressed: () {
                //do something
              },
            )),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Click an icon to get started!",
                style: TextStyle(
                    color: Color(0xFF6594a3),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Card(
                        color: Color(0xFF6594a3),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.access_alarm,
                                color: Color(0xFFdce9e8),
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Alarms",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Card(
                        color: Color(0xFF6594a3),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.timer_rounded,
                                color: Color(0xFFdce9e8),
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Pomodoro",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Card(
                        color: Color(0xFF6594a3),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.today,
                                color: Color(0xFFdce9e8),
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Calendar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Card(
                        color: Color(0xFF6594a3),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.assignment_rounded,
                                color: Color(0xFFdce9e8),
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Tasks List",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Card(
                        color: Color(0xFF6594a3),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.add_rounded,
                                color: Color(0xFFdce9e8),
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Connect",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Card(
                        color: Color(0xFF6594a3),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.settings,
                                color: Color(0xFFdce9e8),
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
