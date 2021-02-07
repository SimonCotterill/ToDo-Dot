import 'package:flutter/material.dart';
import 'package:todo_dot/main.dart';
import 'package:todo_dot/settings.dart';
import 'style.dart';

// https://www.youtube.com/watch?v=iX07Xnn4ol8&ab_channel=PradipDebnath
// https://doctorcodetutorial.blogspot.com/2020/09/make-flutter-navigation-drawer-in.html
// Naviagtion: https://medium.com/@maffan/screen-navigation-in-flutter-apps-with-data-handling-67b09cc04a75

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: todoLightGrey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(LogoName: 'assets/To_Do_Light.png')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SideButton(
              SideIcon: Icons.home_rounded,
              SideText: "Home Page",
              Route: Dashboard()),
          SideButton(
            SideIcon: Icons.assignment_rounded,
            SideText: "To-Do List",
            Route: Dashboard(),
          ),
          SideButton(
            SideIcon: Icons.today,
            SideText: "Calendar",
            Route: Dashboard(),
          ),
          SideButton(
            SideIcon: Icons.timer_rounded,
            SideText: "Pomodoro",
            Route: Dashboard(),
          ),
          SideButton(
            SideIcon: Icons.hourglass_top_rounded,
            SideText: "Track Time",
            Route: Dashboard(),
          ),
          SideButton(
            SideIcon: Icons.add_rounded,
            SideText: "Connect",
            Route: Dashboard(),
          ),
          SideButton(
            SideIcon: Icons.settings,
            SideText: "Settings",
            Route: Settings(),
          ),
        ],
      ),
    );
  }
}
