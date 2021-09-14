import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/bmi_data.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.bmiData})
      : super(key: key);

  final BmiData bmiData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: kAppTitle,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(35.0, 0, 35.0, 35.0),
              color: kActiveCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(bmiData.result),
                  ),
                  Text(
                    bmiData.bmi.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Normal BMI Range:'),
                  SizedBox(
                    height: 5,
                  ),
                  const Text('18.5 - 25 kg/m\u00b2'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(bmiData.resultText),
                ],
              ),
            ),
          ),
          Container(
            height: 50.0,
            color: kAccentColor,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'RE-CALCULATE YOUR BMI',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
