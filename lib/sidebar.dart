import 'package:flutter/material.dart';
import 'style.dart';

// https://www.youtube.com/watch?v=iX07Xnn4ol8&ab_channel=PradipDebnath

class SideBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: todoLightGrey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(LogoName: 'assets/To_Do_Light.png')),
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SideButton(
                SideIcon: Icons.home_rounded,
                SideText: "Home Page",
              ),
              SideButton(
                SideIcon: Icons.assignment_rounded,
                SideText: "To-Do List",
              ),
              SideButton(
                SideIcon: Icons.today,
                SideText: "Calendar",
              ),
              SideButton(
                SideIcon: Icons.timer_rounded,
                SideText: "Pomodoro",
              ),
              SideButton(
                SideIcon: Icons.hourglass_top_rounded,
                SideText: "Track Time",
              ),
              SideButton(
                SideIcon: Icons.add_rounded,
                SideText: "Connect",
              ),
              SideButton(
                SideIcon: Icons.settings,
                SideText: "Settings",
              ),
            ],
          ),
      );
  }
}
