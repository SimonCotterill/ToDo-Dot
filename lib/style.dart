import 'package:flutter/material.dart';

// project colors
Color todoLightGrey = Color(0xFFe9e9f2);
Color todoDarkGrey = Color(0xFFd3d1dd);
Color todoBlue = Color(0xFF6594a3);
Color todoDarkGreen = Color(0xFF214e4c);
Color todoMediumGreen = Color(0xFF589590);
Color todoLightGreen = Color(0xFFdce9e8);

// Button widget https://www.youtube.com/watch?v=h6OmR0TpWJU&ab_channel=LuisTheTechGuy%21
class HomeButton extends StatelessWidget {
  final IconData ButtonIcon;
  final String TextIcon;

  const HomeButton({
    this.ButtonIcon, this.TextIcon,
  }) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      height: 180.0,
      child: Card(
        color: todoBlue,
        elevation: 15.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0)),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 8.0),
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