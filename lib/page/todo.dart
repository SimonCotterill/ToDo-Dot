import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_dot/todoprovider.dart';

import 'dashboard.dart';
import 'sidebar.dart';
import 'package:todo_dot/style.dart';

//https://pub.dev/packages/circular_check_box
//https://www.youtube.com/watch?v=kN9Yfd4fu04&ab_channel=JohannesMilke

class ToDo extends StatefulWidget {
  ToDo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ToDoState createState() => ToDoState();
}

class ToDoState extends State<ToDo> {
  int selectedIndex = 0;
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ToDoList(),
      Container(),
    ];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
      drawer: Drawer(
        child: SideBar(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: todoDarkGreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: todoLightGreen,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'ToDos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: todoDarkGreen,
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          child: AddTodo(),
          barrierDismissible: false,
        ),
      ),
    );
  }
}

class AddTodo extends StatefulWidget {

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column (
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add To Do',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          )
        ),
        SizedBox(height: 10),
        TodoForm(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedTodo: () {},
        ),

      ],
    )
  );
}

class TodoForm extends StatelessWidget{
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoForm({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 8),
        buildDescription(),
        SizedBox(height: 25),
        buildButton(),
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    onChanged: onChangedTitle,

    validator: (title){
      if (title.isEmpty){
        return 'The title cannot be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title',
    ),
  );

  Widget buildDescription() => TextFormField(
      maxLines: 3,
      initialValue: description,
      onChanged: onChangedDescription,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Description',
    ),
  );

  Widget buildButton() => Container(
    height: 40.0,
    width: 120,
    decoration: BoxDecoration(
      color: todoDarkGreen,
      borderRadius: BorderRadius.circular(30),
    ),
    child: FlatButton(
      onPressed: onSavedTodo,
      child: Center(
        child: Text(
          'Save',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
      ),
    ),
  );

}


//Other To do stuff

class TodoField{
  static const createdTime = 'createdTime';
}

class Todo{
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    
    return todos.isEmpty
      ? Center(
        child: Text(
            'No To Dos ',
            style: TextStyle(fontSize: 20),
          ),
      )
        : ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          separatorBuilder: (context, index) => Container(height: 8),
          itemCount: todos.length,
          itemBuilder: (context, index){
            final todo = todos[index];
            return TodoWidget(todo: todo);
          },
    );
  }
}

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    @required this.todo,
    Key key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(25),
    child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () {},
            caption: 'Edit',
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            caption: 'Delete',
            onTap: () {},
            icon: Icons.delete,
          ),
        ],
        child: buildTodo(context),
    ),
  );

  Widget buildTodo(BuildContext context) =>
   Container(
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        CircularCheckBox(
            value: todo.isDone,
            checkColor: Colors.white,
            activeColor: todoMediumGreen,
            inactiveColor: Colors.redAccent,
            disabledColor: Colors.grey,
            onChanged: (_) {}
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              todo.title,
              style: TextStyle(
                fontSize: 28,
                ),
              ),
              if (todo.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                  todo.description,
                  style: TextStyle(
                  fontSize: 20,
                    ),
                  ),
                ),
            ],
          )
        )
      ],
    ),
  );


}


// onTap: ()=> this.setState(() { this.selected= !this.selected ;}),
