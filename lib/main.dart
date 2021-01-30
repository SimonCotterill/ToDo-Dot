import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Dashboard(),
    )
);

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFdce9e8),

        appBar: AppBar(
          backgroundColor: Color(0xFF6594a3),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //todo: COMMENT: Maybe text or image? both might be a little much
              Text('Home Page'),
              Image.asset('assets/ToDo_Logo.png', fit: BoxFit.contain, height: 32),
            ],
          ),
            actions: <Widget> [
              //todo: COMMENT: Menu Icon Left side or right side?

            //Menu Button
            IconButton(
                icon: Icon (Icons.menu, color: Color(0xFFdce9e8), size: 40,
                ),
                onPressed: () {
                  //do something
                },
                )
            ] ,
        ),
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      //todo: COMMENT: Maybe use button instead of card?
                      //todo: COMMENT: I don't think you can press on card
                    )
                )
              ],

            )
        )
    );
  }
}
