import 'package:bmi_app/frame_border.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi, this.result});

  String bmi;
  String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          children: [
            FrameBorder(
              color: Color(0xFF1d1e33),
              childWidget: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Your BMI is $bmi',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25.0)),
            FrameBorder(
              color: Color(0xFF1d1e33),
              childWidget: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'You are $result',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
