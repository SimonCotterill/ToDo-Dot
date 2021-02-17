import 'package:flutter/material.dart';
import 'style.dart';
import 'sidebar.dart';
import 'settings.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
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
                      ButtonIcon: Icons.hourglass_top_rounded,
                      TextIcon: "Track Time",
                      Route: Dashboard(),
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      ButtonIcon: Icons.timer_rounded,
                      TextIcon: "Pomodoro",
                      Route: Dashboard(),
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      ButtonIcon: Icons.today,
                      TextIcon: "Calendar",
                      Route: Dashboard(),
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      ButtonIcon: Icons.assignment_rounded,
                      TextIcon: "To-Do List",
                      Route: Dashboard(),
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      ButtonIcon: Icons.add_rounded,
                      TextIcon: "Connect",
                      Route: Dashboard(),
                      //TODO: Create page for this and remove default
                    ),
                    HomeButton(
                      ButtonIcon: Icons.settings,
                      TextIcon: "Settings",
                      Route: Settings(),
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
