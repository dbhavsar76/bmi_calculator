import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/SelectorPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        splashColor: Colors.white,
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 20.0,
        ),
      ),
      home: SelectorPage(),
    );
  }
}
