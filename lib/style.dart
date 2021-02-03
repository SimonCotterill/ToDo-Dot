import 'package:flutter/material.dart';

// project colors
Color todoLightGrey = Color(0xFFe9e9f2);
Color todoDarkGrey = Color(0xFFd3d1dd);
Color todoBlue = Color(0xFF6594a3);
Color todoDarkGreen = Color(0xFF214e4c);
Color todoMediumGreen = Color(0xFF589590);
Color todoLightGreen = Color(0xFFdce9e8);

// Main App Bar for App
class ToDoAppBar extends StatelessWidget {
  final String LogoName;

  const ToDoAppBar({
    this.LogoName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image.asset(LogoName, fit: BoxFit.contain, height: 50),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 12, 0, 0),
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
        ));
  }
}

// Button widget https://www.youtube.com/watch?v=h6OmR0TpWJU&ab_channel=LuisTheTechGuy%21
class HomeButton extends StatelessWidget {
  final IconData ButtonIcon;
  final String TextIcon;

  const HomeButton({
    this.ButtonIcon,
    this.TextIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      height: 180.0,
      child: Card(
        color: todoBlue,
        elevation: 15.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Column(
            children: <Widget>[
              Icon(
                ButtonIcon,
                color: todoLightGrey,
                size: 80.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                TextIcon,
                style: TextStyle(
                    color: todoLightGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
