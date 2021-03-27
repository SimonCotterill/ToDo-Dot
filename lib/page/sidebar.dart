import 'package:flutter/material.dart';
import 'package:todo_dot/page/dashboard.dart';
import 'package:todo_dot/page/pomodoro.dart';
import 'package:todo_dot/style.dart';
import 'settings.dart';

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
            routestless: Dashboard(),
            isStLess: true,
          ),
          SideButton(
            icon: Icons.assignment_rounded,
            text: "To-Do List",
            routestless: Dashboard(),
            isStLess: true,
            //TODO: Create page for this and remove default
          ),
          SideButton(
            icon: Icons.timer_rounded,
            text: "Pomodoro",
            routestful: Pomodoro(),
            isStLess: false,
          ),
          SideButton(
            icon: Icons.today,
            text: "Calendar",
            routestless: Dashboard(),
            isStLess: true,
            //TODO: Create page for this and remove default
          ),
          SideButton(
            icon: Icons.add_rounded,
            text: "Connect",
            routestless: Dashboard(),
            isStLess: true,
            //TODO: Create page for this and remove default
          ),
          SideButton(
            icon: Icons.settings,
            text: "Settings",
            routestless: Settings(),
            isStLess: true,
          ),
        ],
      ),
    );
  }
}
