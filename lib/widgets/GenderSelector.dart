import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/CustomCard.dart';
import 'package:bmi_calculator/constants.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({
    Key? key,
    this.onGenderSelect,
  }) : super(key: key);

  final void Function(Gender)? onGenderSelect;

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  Gender? _gender;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.male,
                  size: 80.0,
                  color: Colors.white,
                ),
                const Text('MALE'),
              ],
            ),
            color: _gender == Gender.male ? kActiveCardColor : kCardColor,
            onTap: () {
              setState(() {
                _gender = Gender.male;
              });
              widget.onGenderSelect!(Gender.male);
            },
          ),
          CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.female,
                  size: 80.0,
                  color: Colors.white,
                ),
                const Text('FEMALE'),
              ],
            ),
            color: _gender == Gender.female ? kActiveCardColor : kCardColor,
            onTap: () {
              setState(() {
                _gender = Gender.female;
              });
              widget.onGenderSelect!(Gender.female);
            },
          )
        ],
      ),
    );
  }
}
