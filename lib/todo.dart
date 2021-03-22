import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

import 'main.dart';
import 'sidebar.dart';
import 'style.dart';

//https://pub.dev/packages/circular_check_box

class ToDo extends StatefulWidget {
  ToDo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ToDoState createState() => ToDoState();
}

class ToDoState extends State<ToDo> {
  bool selected=true ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
      drawer: Drawer(
        child: SideBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
              tiles: [
                ListTile(
                  leading: CircularCheckBox(
                      value: this.selected,
                      checkColor: Colors.white,
                      activeColor: todoMediumGreen,
                      inactiveColor: Colors.redAccent,
                      disabledColor: Colors.grey,
                      onChanged: (val) => this.setState(() { this.selected= !this.selected ;})
                  ),
                  trailing: GestureDetector(
                    child: Icon(Icons.edit_rounded),
                    onTap: () => {
                      Navigator.push(
                        //TODO: Change edit button to go to edit page
                          context, MaterialPageRoute(builder: (context) => Dashboard()))
                    },
                  ),
                  title: Text(
                      "Task 1",
                    style: TextStyle(
                      fontSize: 28,
                    )
                  ),
                  // onTap: ()=> this.setState(() { this.selected= !this.selected ;}),
                ),
                ListTile(
                  leading: CircularCheckBox(
                      value: this.selected,
                      checkColor: Colors.white,
                      activeColor: todoMediumGreen,
                      inactiveColor: Colors.redAccent,
                      disabledColor: Colors.grey,
                      onChanged: (val) => this.setState(() { this.selected= !this.selected ;})
                  ),
                  trailing: GestureDetector(
                    child: Icon(Icons.edit_rounded),
                    onTap: () => {
                      Navigator.push(
                        //TODO: Change edit button to go to edit page
                          context, MaterialPageRoute(builder: (context) => Dashboard()))
                    },
                  ),
                  title: Text(
                      "Task 2",
                      style: TextStyle(
                        fontSize: 28,
                      )
                  ),
                  // onTap: ()=> this.setState(() { this.selected= !this.selected ;}),
                ),
                ],
          ).toList(),
        ),
      ),
    );
  }
}
