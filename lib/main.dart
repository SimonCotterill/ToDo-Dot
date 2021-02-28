import 'package:flutter/material.dart';
import 'style.dart';
import 'settings.dart';
import 'sidebar.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      theme: ThemeData(
        fontFamily: 'OpenSans'
        )
      )
    );

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: ToDoAppBar(LogoName: 'assets/To_Do_Light.png')),
        drawer: Drawer(
          child: SideBar(),
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
                    ),
                    HomeButton(
                      icon: Icons.today,
                      text: "Calendar",
                      routestless: Dashboard(),
                      isStLess: true,
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      icon: Icons.hourglass_top_rounded,
                      text: "Track Time",
                      routestless: Dashboard(),
                      isStLess: true,
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      icon: Icons.add_rounded,
                      text: "Connect",
                      routestless: Dashboard(),
                      isStLess: true,
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      icon: Icons.settings,
                      text: "Settings",
                      routestless: Settings(),
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
