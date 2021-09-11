import 'dart:math';

import 'package:bmi_calculator/constants.dart';

class BmiData {
  final Gender gender;
  final int height;
  final int weight;
  final int age;

  BmiData({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age
  });

  double get bmi => weight / pow(height / 100, 2);

  String get result {
    final bmi = this.bmi;
    if (bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmi < 25) {
      return 'NORMAL';
    } else {
      return 'OVERWEIGHT';
    }
  }

  String get resultText {
    final bmi = this.bmi;
    if (bmi < 18.5) {
      return 'You are Underweigth.';
    } else if (bmi < 25) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You are Overweight.';
    }
  }
}