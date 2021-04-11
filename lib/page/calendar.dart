import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:todo_dot/helper/dates_list.dart';
import 'package:todo_dot/model/task.dart';
import 'package:todo_dot/style.dart';

import 'sidebar.dart';
import 'todo.dart';

// https://github.com/TheAlphaApp/flutter-task-planner-app/blob/master/lib/screens/calendar_page.dart

//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

void main() {
  initializeDateFormatting().then((_) => runApp(Calendar()));
}

class Calendar extends StatefulWidget {
  Calendar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {};

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

//Page layout
  @override
  Widget build(BuildContext context) {
    // add active tasks with alarms to events in calendar
    final provider = Provider.of<TaskProvider>(context);
    final tasks = provider.tasks;
    List<DateTime> days = List.empty(growable: true);

    if (tasks != null && tasks.isNotEmpty) {
      for (var i = 0; i < tasks.length; i++) {
        if (!tasks[i].isComplete && tasks[i].alertTime != null)
          days.add(tasks[i].alertTime);
      }
    }
    // TODO update to get title, description, and alert time of each task
    if (days.isNotEmpty) {
      for (var i = 0; i < days.length; i++) {
        _events[days[i]] = tasks
            .where((task) => task.alertTime?.year == days[i].year)
            .where((task) => task.alertTime?.month == days[i].month)
            .where((task) => task.alertTime?.day == days[i].day)
            .toList();
      }
    }

    // flat button was deprecated
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.black87,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
        drawer: Drawer(
          child: SideBar(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              5,
              20,
              0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 30.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        height: 40.0,
                        width: 120,
                        decoration: BoxDecoration(
                          color: todoDarkGreen,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          style: flatButtonStyle,
                          // TODO refresh state when task is added
                          // to display task without navigating away from page
                          onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => new AddTask(),
                            barrierDismissible: false,
                          ),
                          child: Center(
                            child: Text(
                              'Add task',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '$formattedMonth $formattedDay, $formattedYear',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    _buildButtons(),
                  ],
                ),
                SizedBox(height: 5.0),
                _buildTableCalendar(),
                const SizedBox(height: 8.0),
                Expanded(child: _buildEventList()),
              ],
            ),
          ),
        ));
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: todoDarkGreen,
        todayColor: todoMediumGreen,
        markersColor: todoDarkGreen,
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: todoMediumGreen),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: todoMediumGreen),
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: todoDarkGreen,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildButtons() {
    final dateTime = DateTime.now();

    // flat button was deprecated
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.black87,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 25,
              width: 75,
              decoration: BoxDecoration(
                color: todoDarkGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                style: flatButtonStyle,
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _calendarController.setSelectedDay(
                    DateTime(dateTime.year, dateTime.month, dateTime.day),
                    runCallback: true,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}

//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0
