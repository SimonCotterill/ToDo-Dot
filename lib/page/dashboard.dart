import 'package:flutter/material.dart';

import 'package:todo_dot/page/calendar.dart';
import 'package:todo_dot/style.dart';

import 'connect.dart';
import 'pomodoro.dart';
import 'sidebar.dart';
import 'todo.dart';

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
                      routestful: ToDo(),
                      isStLess: false,
                    ),
                    HomeButton(
                      icon: Icons.timer_rounded,
                      text: "Pomodoro",
                      routestful: Pomodoro(),
                      isStLess: false,
                    ),
                    HomeButton(
                      icon: Icons.today,
                      text: "Calendar",
                      routestful: Calendar(),
                      isStLess: false,
                    ),
                    HomeButton(
                      icon: Icons.add_rounded,
                      text: "Connect",
                      routestful: Connect(),
                      isStLess: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
