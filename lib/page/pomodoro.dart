import 'package:flutter/material.dart';
import 'package:todo_dot/style.dart';
import 'dart:math' as math;
import 'sidebar.dart';

// https://github.com/tensor-programming/flutter_timer_example/blob/master/lib/main.dart
// https://www.youtube.com/watch?v=tRe8teyf9Nk&ab_channel=TensorProgramming

class Pomodoro extends StatefulWidget {
  @override
  PomodoroState createState() => PomodoroState();
}

class PomodoroState extends State<Pomodoro> with TickerProviderStateMixin {
  AnimationController controller;

  // bool isPlaying = false;
  var _timer = 10;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      // change duration with timer variable
      duration: Duration(minutes: _timer),
    );

    // ..addStatusListener((status) {
    //     if (controller.status == AnimationStatus.dismissed) {
    //       setState(() => isPlaying = false);
    //     }

    //     print(status);
    //   })
  }

  void _setTimer(int time) {
    setState(() => _timer = time);
    controller = AnimationController(
      vsync: this,
      // change duration with timer variable
      duration: Duration(minutes: time),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: todoLightGrey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ToDoAppBar(headerImage: 'assets/To_Do_Light.png')),
      drawer: Drawer(
        child: SideBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                                painter: TimerPainter(
                              animation: controller,
                              backgroundColor: Colors.white,
                              color: todoMediumGreen,
                            ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(children: <Widget>[
                              Text(
                                "Time Remaining",
                                style: themeData.textTheme.subtitle1,
                              ),
                              _timer == 25
                                  ? Text(
                                      "Study",
                                      style: themeData.textTheme.subtitle1,
                                    )
                                  : Text(
                                      "Break",
                                      style: themeData.textTheme.subtitle1,
                                    ),
                            ]),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: themeData.textTheme.headline1,
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40.0,
                  width: 120,
                  decoration: BoxDecoration(
                    color: todoMediumGreen,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      _setTimer(25);
                    },
                    child: Center(
                      child: Text(
                        '25 min',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40.0,
                  width: 120,
                  decoration: BoxDecoration(
                    color: todoMediumGreen,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      _setTimer(5);
                    },
                    child: Center(
                      child: Text(
                        '5 min',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: FloatingActionButton(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget child) {
                          return Icon(controller.isAnimating
                              ? Icons.pause
                              : Icons.play_arrow);

                          // Icon(isPlaying
                          // ? Icons.pause
                          // : Icons.play_arrow);
                        },
                      ),
                      onPressed: () {
                        // setState(() => isPlaying = !isPlaying);

                        if (controller.isAnimating) {
                          controller.stop(canceled: true);
                        } else {
                          controller.reverse(
                              from: controller.value == 0.0
                                  ? 1.0
                                  : controller.value);
                        }
                      },
                      backgroundColor: todoDarkGreen,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Big circle
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    // Convert progress into radians
    double progress = (1.0 - animation.value) * 2 * math.pi;
    // Draw Arc
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
