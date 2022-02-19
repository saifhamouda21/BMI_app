import 'package:flutter/material.dart';

class FrameBorder extends StatelessWidget {
  FrameBorder({this.color, this.childWidget, this.onPress});

  Color color;
  Widget childWidget;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}
