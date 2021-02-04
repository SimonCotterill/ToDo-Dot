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
            child: ToDoAppBar(LogoName: 'assets/To_Do_Light.png')),

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
                    HomeButton(
                      ButtonIcon: Icons.hourglass_top_rounded,
                      TextIcon: "Track Time",
                    ),
                    HomeButton(
                      ButtonIcon: Icons.timer_rounded,
                      TextIcon: "Pomodoro",
                    ),
                    HomeButton(
                      ButtonIcon: Icons.today,
                      TextIcon: "Calendar",
                    ),
                    HomeButton(
                      ButtonIcon: Icons.assignment_rounded,
                      TextIcon: "To-Do List",
                    ),
                    HomeButton(
                      ButtonIcon: Icons.add_rounded,
                      TextIcon: "Connect",
                    ),
                    HomeButton(
                      ButtonIcon: Icons.settings,
                      TextIcon: "Settings",
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
