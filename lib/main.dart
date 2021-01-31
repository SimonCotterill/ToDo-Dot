import 'package:flutter/material.dart';
import 'style.dart';

void main() => runApp(MaterialApp(
      home: Dashboard(),
    ));

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: todoLightGreen,
        appBar: AppBar(
            backgroundColor: todoDarkGreen,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              // Source: https://stackoverflow.com/questions/43981406/how-to-center-the-title-of-an-appbar
              children: [
                //todo: COMMENT: Maybe text or image? both might be a little much
                // Removed: Text('Home Page'),
                Image.asset('assets/To_Do_Light.png',
                    fit: BoxFit.contain, height: 45),
              ],
            ),
            leading: new IconButton(
              icon: Icon(
                Icons.menu,
                color: todoLightGrey,
                size: 40,
              ),
              onPressed: () {
                //do something
              },
            )),

        //Buttons
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    //Track time
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.access_alarm,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Track Time",
                                style: TextStyle(
                                    color: todoLightGrey,
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

                    //Pomodoro
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.timer_rounded,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Pomodoro",
                                style: TextStyle(
                                    color: todoLightGrey,
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

                    //Calendar
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.today,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Calendar",
                                style: TextStyle(
                                    color: todoLightGrey,
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

                    //To-Do List
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.assignment_rounded,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "To-Do List",
                                style: TextStyle(
                                    color: todoLightGrey,
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

                    //Connect
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.add_rounded,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Connect",
                                style: TextStyle(
                                    color: todoLightGrey,
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

                    //Settings
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.settings,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(
                                    color: todoLightGrey,
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
