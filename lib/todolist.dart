import 'package:flutter/material.dart';
import 'style.dart';

// Inspiration from https://github.com/josealvaradoo/flutter-todolist

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
      children: <Widget>[
        ToDoAppBar(
          LogoName: 'assets/To_Do_Light.png',
        ),
        TaskList()
      ],
    ));
  }
}

class ToDoListTask extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          child: Column(children: <Widget>[
            Expanded(
              child: Container(),
              flex: 1,
            ),
            Expanded(child: TaskView(), flex: 3)
          ]),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/background/background-hdpi/Background.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TaskTitle(
            title: 'Aprender Flutter',
          ),
          TaskContent(text: 'Lorem ipsum lorem')
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
    );
  }
}

class TaskTitle extends StatelessWidget {
  TaskTitle({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.all(20.0),
          child: Text('$title!',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0)),
        ),
        flex: 1);
  }
}

class TaskContent extends StatelessWidget {
  TaskContent({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.all(20.0),
          child: Text('$text!',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey[600], fontSize: 18.0)),
        ),
        flex: 8);
  }
}

class TaskItem extends StatelessWidget {
  TaskItem({this.title, this.completed = false});
  final String title;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
          image: completed
              ? AssetImage('assets/images/icons/completed.png')
              : AssetImage('assets/images/icons/non-completed.png')),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16.0,
            color: completed ? Colors.grey[300] : Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          child: ListView(
            children: <Widget>[
              TaskItem(
                title: 'Task completed',
                completed: true,
              ),
              TaskItem(title: 'Task non-completed')
            ],
          ),
        ),
        flex: 5);
  }
}
