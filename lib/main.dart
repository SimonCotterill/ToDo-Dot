import 'package:flutter/material.dart';
import 'style.dart';

void main() => runApp(MaterialApp(
      home: Dashboard(),
    ));

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: todoLightGrey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
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
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Image.asset('assets/To_Do_Light.png',
                        fit: BoxFit.contain, height: 50),
                  ),
                ],
              ),
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(5,12,0,0),
                child: new IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: todoLightGrey,
                    size: 40,
                  ),
                  onPressed: () {
                    //do something
                  },
                ),
              )),
        ),

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
                      height: 180.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.hourglass_top_rounded,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 20.0,
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
                      height: 180.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.timer_rounded,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 20.0,
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
                      height: 180.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.today,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 20.0,
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
                      height: 180.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.assignment_rounded,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 20.0,
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
                      height: 180.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.add_rounded,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 20.0,
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
                      height: 180.0,
                      child: Card(
                        color: todoBlue,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.settings,
                                color: todoLightGrey,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 20.0,
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
