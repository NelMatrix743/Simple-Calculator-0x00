import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final MaterialColor buttonColor;
  final MaterialColor buttonTextColor;
  final String buttonText;

  const CalculatorButton({
    super.key,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: buttonColor,
        child: Center(
          child: Text(buttonText, style: TextStyle(color: buttonTextColor)),
        ),
      ),
    );
  }
}
