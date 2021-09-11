import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/bmi_data.dart';
import 'package:bmi_calculator/screens/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/CustomCard.dart';
import 'package:bmi_calculator/widgets/GenderSelector.dart';

class SelectorPage extends StatefulWidget {
  SelectorPage({Key? key}) : super(key: key);

  @override
  _SelectorPageState createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  Gender? _gender;
  int _height = 180;
  int _weight = 60;
  int _age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kAppTitle,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GenderSelector(
            onGenderSelect: (gender) {
              _gender = gender;
            },
          ),
          CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('HEIGHT'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      _height.toString(),
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text('CM'),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: kAccentColor,
                    inactiveTrackColor: kInactiveColor,
                    overlayColor: kAccentColor.withOpacity(0.32),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 20.0,
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 35.0,
                    ),
                  ),
                  child: Slider(
                    min: 120,
                    max: 240,
                    value: _height.toDouble(),
                    label: _height.toString(),
                    onChanged: (val) {
                      setState(() {
                        _height = val.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('WEIGHT'),
                      Text(
                        _weight.toString(),
                        style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _weight = max(_weight - 1, 30);
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              size: 40.0,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0x22FFFFFF),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20.0),
                              elevation: 0,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _weight = min(_weight + 1, 120);
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: 40.0,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0x22FFFFFF),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20.0),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('AGE'),
                      Text(
                        _age.toString(),
                        style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _age = max(_age - 1, 10);
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              size: 40.0,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0x22FFFFFF),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20.0),
                              elevation: 0,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _age = min(_age + 1, 90);
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: 40.0,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0x22FFFFFF),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20.0),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50.0,
            color: kAccentColor,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      bmiData: BmiData(
                        gender: _gender ?? Gender.male,
                        age: _age,
                        height: _height,
                        weight: _weight,
                      ),
                    );
                  }),
                );
              },
              child: const Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
