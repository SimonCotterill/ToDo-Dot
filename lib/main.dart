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
                    HomeButton(ButtonIcon: Icons.hourglass_top_rounded, TextIcon: "Track Time",),
                    HomeButton(ButtonIcon: Icons.timer_rounded, TextIcon: "Pomodoro",),
                    HomeButton(ButtonIcon: Icons.today, TextIcon: "Calendar",),
                    HomeButton(ButtonIcon: Icons.assignment_rounded, TextIcon: "To-Do List",),
                    HomeButton(ButtonIcon: Icons.add_rounded, TextIcon: "Connect",),
                    HomeButton(ButtonIcon: Icons.settings, TextIcon: "Settings",),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}

