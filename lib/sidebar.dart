import 'package:flutter/material.dart';
import 'package:todo_dot/main.dart';
import 'settings.dart';
import 'style.dart';

// https://www.youtube.com/watch?v=iX07Xnn4ol8&ab_channel=PradipDebnath
// https://doctorcodetutorial.blogspot.com/2020/09/make-flutter-navigation-drawer-in.html
// Naviagtion: https://medium.com/@maffan/screen-navigation-in-flutter-apps-with-data-handling-67b09cc04a75

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SideButton(
            icon: Icons.home_rounded,
            text: "Home Page",
            route: Dashboard(),
          ),
          SideButton(
            icon: Icons.assignment_rounded,
            text: "To-Do List",
            route: Dashboard(),
            //TODO: Create page for this and remove default
          ),
          SideButton(
            icon: Icons.timer_rounded,
            text: "Pomodoro",
            route: Dashboard(),
            //TODO: Create page for this and remove default
          ),
          SideButton(
            icon: Icons.today,
            text: "Calendar",
            route: Dashboard(),
            //TODO: Create page for this and remove default
          ),
          SideButton(
            icon: Icons.hourglass_top_rounded,
            text: "Track Time",
            route: Dashboard(),
            //TODO: Create page for this and remove default
          ),
          SideButton(
            icon: Icons.add_rounded,
            text: "Connect",
            route: Dashboard(),
            //TODO: Create page for this and remove default
          ),
          SideButton(
            icon: Icons.settings,
            text: "Settings",
            route: Settings(),
            //TODO: Create page for this and remove default
          ),
        ],
      ),
    );
  }
}
