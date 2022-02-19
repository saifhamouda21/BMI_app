import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  IconData icon;
  String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff8d8e98),
          ),
        ),
      ],
    );
  }
}
