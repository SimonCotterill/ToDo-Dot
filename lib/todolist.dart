import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'style.dart';
import 'classes/task.dart';
import 'addtask.dart';
import 'dart:async';
import 'database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'CustomWidget.dart';
import 'utils.dart';

// Inspiration from https://github.com/josealvaradoo/flutter-todolist
// https://medium.com/flutter-community/simple-to-do-list-app-in-flutter-26abc50db741
// https://levelup.gitconnected.com/making-a-flutter-todo-app-from-scratch-part-1-bd66608b1818
// https://everyday.codes/tutorials/developing-a-todo-app-with-flutter-part-2/

// class ToDoList extends StatelessWidget {
//   final List<String> stringTasks = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(80.0),
//           child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
//       drawer: Drawer(
//         child: SideBar(),
//       ),
//       body: ListView.builder(
//           scrollDirection: Axis.vertical,
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           itemCount: stringTasks.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(stringTasks[index]),
//               trailing: IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () {},
//               ),
//             );
//           }),
//       floatingActionButton: FloatingActionButton(
//         // TODO open an add page
//         onPressed: () => {},
//         backgroundColor: todoDarkGreen,
//         tooltip: 'Add Item',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class todo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return todo_state();
  }
}

class todo_state extends State<todo> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  Utils utility = new Utils();
  List<Task> taskList;
  int count = 0;
  final homeScaffold = GlobalKey<ScaffoldState>();

  // appBar: PreferredSize(
  //         preferredSize: Size.fromHeight(80.0),
  //         child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),

  @override
  Widget build(BuildContext context) {
    if (taskList == null) {
      taskList = List<Task>();
      updateListView();
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: homeScaffold,
          appBar: AppBar(
            title: Text(
              'To-Do List',
              style: TextStyle(fontSize: 25),
            ),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.format_list_numbered_rtl),
              ),
              Tab(
                icon: Icon(Icons.playlist_add_check),
              )
            ]),
          ),
          drawer: Drawer(
            child: SideBar(),
          ), //AppBar
          body: TabBarView(children: [
            new Container(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: databaseHelper.getInCompleteTaskList(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Text("Loading");
                        } else {
                          if (snapshot.data.length < 1) {
                            return Center(
                              child: Text(
                                'No Tasks Added',
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder:
                                  (BuildContext context, int position) {
                                return new GestureDetector(
                                    onTap: () {
                                      if (snapshot.data[position].status !=
                                          "Task Completed")
                                        navigateToTask(snapshot.data[position],
                                            "Edit Task", this);
                                    },
                                    child: Card(
                                      margin: EdgeInsets.all(1.0),
                                      elevation: 2.0,
                                      child: CustomWidget(
                                        title: snapshot.data[position].task,
                                        sub1: snapshot.data[position].date,
                                        sub2: snapshot.data[position].time,
                                        status: snapshot.data[position].status,
                                        delete:
                                            snapshot.data[position].status ==
                                                    "Task Completed"
                                                ? IconButton(
                                                    icon: Icon(Icons.delete),
                                                    onPressed: null,
                                                  )
                                                : Container(),
                                        trailing: Icon(
                                          Icons.edit,
                                          color: Theme.of(context).primaryColor,
                                          size: 28,
                                        ),
                                      ),
                                    ) //Card
                                    );
                              });
                        }
                      },
                    ),
                  )
                ],
              ),
            ), //Container
            new Container(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: databaseHelper.getCompleteTaskList(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Text("Loading");
                        } else {
                          if (snapshot.data.length < 1) {
                            return Center(
                              child: Text(
                                'No Tasks Completed',
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder:
                                  (BuildContext context, int position) {
                                return new GestureDetector(
                                    onTap: () {
                                      if (snapshot.data[position].status !=
                                          "Task Completed")
                                        navigateToTask(snapshot.data[position],
                                            "Edit Task", this);
                                    },
                                    child: Card(
                                      margin: EdgeInsets.all(1.0),
                                      elevation: 2.0,
                                      child: CustomWidget(
                                          title: snapshot.data[position].task,
                                          sub1: snapshot.data[position].date,
                                          sub2: snapshot.data[position].time,
                                          status:
                                              snapshot.data[position].status,
                                          delete: snapshot
                                                      .data[position].status ==
                                                  "Task Completed"
                                              ? IconButton(
                                                  icon: Icon(Icons.delete,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 28),
                                                  onPressed: () {
                                                    delete(snapshot
                                                        .data[position].id);
                                                  },
                                                )
                                              : Container(),
                                          trailing: Container()
//                                    Icon(
//                                          Icons.edit,
//                                          color: Theme.of(context).primaryColor,
//                                          size: 28,
//                                        ),
                                          ),
                                    ) //Card
                                    );
                              });
                        }
                      },
                    ),
                  )
                ],
              ),
            ), //Container
          ]),
          floatingActionButton: FloatingActionButton(
              tooltip: "Add Task",
              child: Icon(Icons.add),
              onPressed: () {
                navigateToTask(Task('', '', '', ''), "Add Task", this);
              }), //FloatingActionButton
        ));
  } //build()

  void navigateToTask(Task task, String title, todo_state obj) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new_task(task, title, obj)),
    );
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();

    dbFuture.then((database) {
      Future<List<Task>> taskListFuture = databaseHelper.getTaskList();
      taskListFuture.then((taskList) {
        setState(() {
          this.taskList = taskList;
          this.count = taskList.length;
        });
      });
    });
  } //updateListView()

  void delete(int id) async {
    await databaseHelper.deleteTask(id);
    updateListView();
    //Navigator.pop(context);
    utility.showSnackBar(homeScaffold, 'Task Deleted Successfully');
  }
}

// class ToDoList extends StatefulWidget {
//   @override
//   _ToDoListState createState() => _ToDoListState();
// }

// class _ToDoListState extends State<ToDoList> {
//   // TODO use the task class for this
//   // final List<Task> tasks = [];
//   final List<String> stringTasks = [];

//   // A new callback function to toggle task's completion
//   // void onTaskToggled(Task task) {
//   //   setState(() {
//   //     task.setCompleted(!task.isCompleted());
//   //   });
//   // }

//   // TODO get this value for each task in list
//   bool _checked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(80.0),
//           child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
//       drawer: Drawer(
//         child: SideBar(),
//       ),
//       body: ListView.builder(
//           scrollDirection: Axis.vertical,
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           itemCount: stringTasks.length,
//           itemBuilder: (context, index) {
//             // https://api.flutter.dev/flutter/material/CheckboxListTile-class.html
//             return CheckboxListTile(
//                 title: Text(stringTasks[index]),
//                 secondary: IconButton(
//                   icon: Icon(Icons.edit),
//                   // TODO open an edit page
//                   onPressed: () {},
//                 ),
//                 controlAffinity: ListTileControlAffinity.leading,
//                 value: _checked,
//                 onChanged: (bool value) {
//                   setState(() {
//                     _checked = value;
//                   });
//                   //     title: Text(tasks[index].getName()),
//                 });
//           }),
//       floatingActionButton: FloatingActionButton(
//         // TODO open an add page
//         onPressed: () => {},
//         backgroundColor: todoDarkGreen,
//         tooltip: 'Add Item',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
