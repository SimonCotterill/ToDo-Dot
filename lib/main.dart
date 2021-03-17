import 'package:flutter/material.dart';
import 'style.dart';
import 'sidebar.dart';
import 'settings.dart';
import 'calendar.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      theme: ThemeData(
        fontFamily: 'OpenSans',
      )
    ));

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
        drawer: Drawer(
          child: SideBar(),
        ),
        //Buttons
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    HomeButton(
                      icon: Icons.assignment_rounded,
                      text: "To-Do List",
                      routestless: Dashboard(),
                      isStLess: true,
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      icon: Icons.timer_rounded,
                      text: "Pomodoro",
                      routestless: Dashboard(),
                      isStLess: true,
                      //TODO: Create page for this and remove default
                    ), HomeButton(
                      icon: Icons.today,
                      text: "Calendar",
                      routestful: Calendar(),
                      isStLess: false
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      icon: Icons.add_rounded,
                      text: "Connect",
                      routestless: Dashboard(),
                      isStLess: true,
                      //TODO: Create page for this and remove default
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
