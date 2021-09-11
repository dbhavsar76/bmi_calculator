import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.child,
    this.color = kCardColor,
    this.onTap,
  }) : super(key: key);

  final Widget? child;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
