import 'package:bmi_app/bmi_calculator.dart';
import 'package:bmi_app/frame_border.dart';
import 'package:bmi_app/result_page.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color(0xff1d1e33);
const inactiveColor = Color(0xff111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: FrameBorder(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                    childWidget: IconContent(
                      icon: FontAwesomeIcons.female,
                      label: 'FEMALE',
                    ),
                  ),
                ),
                Expanded(
                  child: FrameBorder(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                    childWidget: IconContent(
                      icon: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FrameBorder(
              color: activeColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18, color: Color(0xff8d8e98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'cm',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff8d8e98)),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: FrameBorder(
                    color: activeColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff8d8e98)),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FrameBorder(
                    color: activeColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff8d8e98)),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMICalculator c =
                  new BMICalculator(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmi: c.calcBMI(),
                  result: c.getResult(),
                );
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              color: Color(0xffeb1555),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 40),
              height: 80,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});

  IconData icon;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 0,
      constraints: BoxConstraints.tightFor(width: 48, height: 48),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f5e),
    );
  }
}
